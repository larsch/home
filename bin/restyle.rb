#!/usr/bin/env ruby
# encoding: ISO-8859-1
#
# Restyle C++ code using AStyle and some additional cleaning up of
# whitespace, copyright notice, etc.
#

FILENAME_PATTERN = /\.(h|c|cpp|hpp|cxx|hxx|c++|h++)$/
ENCODING = 'ISO-8859-1'
ASTYLE_EXECUTABLE = "astyle"
ASTYLE_OPTIONS =  ["-q", "-A1Os3YHUjck1M60Km0" ]
CONDITION_PATTERN = /Copyright.*GateHouse/

@skip_file_if_handlers = []

# Restyle the contents of a file.
def restyle(file)
  content = File.read(file, :encoding => ENCODING)
  if not $opts.force and skip_file(content)
    log "Skipping #{file}"
    return
  end
  orig_content = content.dup
  restyle_code(content, File.expand_path(file))
  restyle_headerguards(content, file) if file =~ /\.(h|hpp|hxx)$/

  temp_file = File.join(ENV["TEMP"], "astyletemp${$$}")
  File.open(temp_file, "w") { |f| f << content }
  options = ASTYLE_OPTIONS + [temp_file]
  system(ASTYLE_EXECUTABLE, *options)
  content = File.read(temp_file, :encoding => ENCODING)
  File.unlink(temp_file)

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
def restyle_code(code, path)
  # Adjust copyright year
  year = Time.now.year.to_s
  code.gsub!(/Copyright \S+ (?:(\d+)(-\d+)*)/) do |m|
    old_start = $1
    year = "#{old_start}-#{year}" if old_start != year
    "Copyright © #{year}"
  end

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
        $1 + " " * [((54 - $2.size)/2),0].max + $2
      }
    }.join("\n")
  }

  # At least one space after C++ style comment markers (//)
  code.gsub!(/(?:^| +)\/\/([a-z0-9])/i, "// \\1")
  
  # Forward slashes in includes
  code.gsub!(/^(\s*#\s*include\s+["<])(.*?)([>"])/) { $1 + $2.tr('\\','/') + $3 }

  # Changed include "" to include <> if file is not found locally
  code.gsub!(/^(\s*#\s*include\s+)"(.*)"/) do
    local = File.join(File.dirname(path), $2)
    if File.exist?(local)
      $&
    else
      "#{$1}<#{$2}>"
    end
  end

  # Strip old CVS keywords
  remove_tags = [ "Revision", "Date", "Author" ].join("|")
  code.gsub!(/^.*\$(#{remove_tags}):.*$.*\n/, "")

  # Remove duplicate //--- lines
  code.gsub!(/(^\/\/-+\n)(^\/\/-+\n)+/, "\\1")
end

HEADER_GUARD_BREAK = /^(impl|src|include|plug-ins|3rdparty)$/

def determine_headerguard(path)
  path = File.expand_path(path)
  lastbasedir = path
  basedir = File.dirname(path)
  hgpath = nil
  while basedir != lastbasedir
    lastbasedir = basedir
    basename = File.basename(basedir)
    if basename =~ HEADER_GUARD_BREAK
      hgpath = path[basedir.size + 1 .. -1]
      break
    elsif File.exist?(File.join(lastbasedir, "CMakeLists.txt")) or File.exist?(File.join(lastbasedir, "..", "changes.txt"))
      hgpath = path[File.dirname(basedir).size + 1 .. -1]
      break
    end
    basedir = File.dirname(basedir)
  end
  hgpath ||= File.basename(path)
  hgpath.downcase!
  hg = "_" + hgpath.gsub(/[^a-z0-9_]/, "_")
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
      stack.last[1] ||= [i,$1] unless stack.empty?
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

def skip_file(content)
  content !~ CONDITION_PATTERN
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
  attr_accessor :edited
end

def get_options
  opts = Options.new
  ARGV.size.times do
    arg = ARGV.shift
    case arg
    when '--force', '-f'
      opts.force = true
    when '--edited', '-e'
      opts.edited = true
    when '--verbose', '-v'
      opts.verbose = true
    when '--diff', '-d'
      opts.diff = true
    when '--help', '-h', '-?'
      puts "Usage:"
      puts "\t#{File.basename($0)} [options] files ..."
      puts "\nOptions:"
      puts "\t --force/-f    Force: restyle files that would normally be skipped"
      puts "\t --verbose/-v  Be verbose"
      puts "\t --diff/-d     Show the change that would be done, but don't actually write them"
      puts "\t --help/-?/-h  Show this information"
      exit
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
  $opts = get_options
  
  # Load tmpdir conditionally (bit more responsive in VS macro)
  require 'tmpdir' if $opts.diff

  if $opts.edited
    require File.join(File.dirname(__FILE__), "edited")
    each_edited_file { |path| ARGV.push(path) if path =~ /\.(h|cpp|c)$/ }
  end
  
  ARGV.each do |path|
    if not File.file?(path)
      puts "#{path} is not a file"
      next
    end
    if path =~ FILENAME_PATTERN
      restyle(path)
    end
  end
  log "#{ARGV.size} file(s) processed"
end
