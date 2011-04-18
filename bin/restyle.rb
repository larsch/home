#!/usr/bin/env ruby
# encoding: ISO-8859-1
#
# Restyle C++ code using AStyle and some additional cleaning up of
# whitespace, copyright notice, etc.
#

FILENAME_PATTERN = /\.(h|c|cpp|hpp|cxx|hxx|c++|h++)$/
ENCODING = 'ISO-8859-1'
ASTYLE_EXECUTABLE = "astyle"
ASTYLE_OPTIONS =  ["-q", "--style=allman", "-Os3YHUjck1M60EK" ]

# Restyle the contents of a file.
def restyle(file)
  content = File.read(file, :encoding => ENCODING)
  if not $opts.force and skip_file(content)
    log "Skipping #{file}"
    return
  end
  orig_content = content.dup
  restyle_code(content)
  restyle_headerguards(content, file) if file =~ /\.(h|hpp|hxx)$/

  temp_file = File.join(ENV["TEMP"], "astyletemp")
  File.open(temp_file, "w") { |f| f << content }
  options = ASTYLE_OPTIONS + [temp_file]
  system(ASTYLE_EXECUTABLE, *options)
  content = File.read(temp_file, :encoding => ENCODING)

  if orig_content != content
    if $opts.diff
      Dir.mktmpdir do |tmppath|
        tempfile = File.join(tmppath, File.basename(file))
        File.open(tempfile, "w") { |f| f << content }
        system("diff", file, tempfile)
      end
    else
      File.open(file, "w") { |f| f << content }
      log "Restyled #{file}"
    end
  end
end

# Restyle a chunk of code (our own rule set)
def restyle_code(code)
  # Adjust copyright year
  year = Time.now.year
  code.gsub!(/Copyright \S+ ((\d+)(-\d+)?)/) { |m| "Copyright © #{year}" }
  # Exactly one newline at end of file
  code.gsub!(/(\S)\s*\z/m, "\\1\n")
  # Only 1 empty line between sections
  code.gsub!(/(\n[ \t]*\n)\s*\n/m, "\\1")
  # No empty lines after open-brace
  code.gsub!(/\{\s*\n/m, "{\n")
  # No empty lines before close-brace
  code.gsub!(/\s*(\n *\})/, "\\1")
  # Centre lines in file header
  code.sub!(/\A\s*\/\/={54}\n(\/\/(.*\n))+?\/\/-{54}/) { |x|
    x.split("\n").map { |ln|
      ln.sub(/\A(\/\/)\s+(.*?)\s*\Z/) { 
        $1 + " " * ((54 - $2.size)/2) + $2
      }
    }.join("\n")
  }
  # Forward slashes in includes
  code.gsub!(/^(\s*#\s*include\s+["<])(.*?)([>"])/) { $1 + $2.tr('\\','/') + $3 }
end

def determine_headerguard(path)
  path = File.expand_path(path)
  lastbasedir = path
  basedir = File.dirname(path)
  hgpath = nil
  while basedir != lastbasedir
    lastbasedir = basedir
    basename = File.basename(basedir)
    if basename == "impl" or basename == "src" or basename == "include"
      hgpath = path[basedir.size + 1 .. -1]
      break
    elsif File.exist?(File.join(lastbasedir, "CMakeLists.txt")) 
      hgpath = path[File.dirname(basedir).size + 1 .. -1]
      break
    end
    basedir = File.dirname(basedir)
  end
  hgpath ||= File.basename(path)
  hgpath.downcase!
  hg = "_" + hgpath.gsub(/[\/\\\.]/, "_")
  return hg
end

def restyle_headerguards(content, path)
  stack = []
  groups = []
  firstline = nil
  lines = content.split("\n")
  lines.each_with_index do |ln, i|
    case ln
    when /^\s*\#\s*if(?:n?def)?\s+(.*)$/
      firstline ||= i
      stack.push [[i,$1]]
    when /^\s*\#\s*define (\w+)$/
      stack.last[1] ||= [i,$1]
    when /^\s*\#\s*endif\s*(.*)$/
      groups.push stack.pop + [[i,$1]]
    end
  end
  last = groups.last

  hg = determine_headerguard(path)

  # If we have well-formed header guards already
  if last && last[0][0] == firstline && last[1][0] == firstline + 1 && last[0][1] == last[1][1]
    lines[last[0][0]] = "#ifndef #{hg}"
    lines[last[1][0]] = "#define #{hg}"
    if last[2][1] =~ /\/\*/
      lines[last[2][0]] = "#endif /* #{hg} */"
    else
      lines[last[2][0]] = "#endif // #{hg}"
    end
  else
  end
  content.replace(lines.join("\n") + "\n")
end

def skip_file_if(&block)
  (@skip_file_if_handlers ||= []) << block
end

def skip_file(content)
  @skip_file_if_handlers.inject(false) { |skip, handler| skip || handler.call(content) }
end

def log(str)
  return unless $opts.verbose
  if $opts.filelog
    File.open("c:/log.txt", "a") do |log|
      log.puts str
    end
  else
    puts str
  end
end

class Options
  attr_accessor :force
  attr_accessor :verbose
  attr_accessor :diff
  attr_accessor :filelog
end

def get_options
  opts = Options.new
  ARGV.size.times do
    arg = ARGV.shift
    case arg
    when '--force', '-f'
      opts.force = true
    when '--verbose', '-v'
      opts.verbose = true
    when '--diff', '-d-'
      opts.diff = true
    when /^-/
      puts "Unknown option: #{arg}"
      exit
    else
      ARGV.push(arg)
    end
  end
  return opts
end

if __FILE__ == $0
  dot_restyle = File.expand_path("~/.restyle")
  load dot_restyle if File.exist?(dot_restyle)
  $opts = get_options
  
  # Load tmpdir conditionally (bit more responsive in VS macro)
  require 'tmpdir' if $opts.diff
  
  ARGV.each do |path|
    if path =~ FILENAME_PATTERN
      restyle(path)
    end
  end
  log "#{ARGV.size} file(s) processed"
end
