#!/usr/bin/env ruby
# encoding: ISO-8859-1
#
# Restyle C++ code using AStyle and some additional cleaning up of
# whitespace, copyright notice, etc.
#

FILENAME_PATTERN = /\.(h|c|cpp|hpp|cxx|hxx|c++|h++)$/
ENCODING = 'ISO-8859-1'
ASTYLE_EXECUTABLE = "astyle"
ASTYLE_OPTIONS =  ["-q"]

ASTYLE_RE = /x?[a-zA-Z]\d*/
ASTYLE_FLAGS = "A1Os3YHUjck1M60EK".scan(ASTYLE_RE)

DEFAULT_OPTIONS = {
  "astyle" => "-A1Os3YHUjck1M60EK",
  "restyle" => "",
}

def replace_or_add(a, opt)
  opt =~ /^x?[a-zA-Z]/i
  optch = $&
  if old_opt = a.find { |o| o.index(optch) == 0 }
    old_opt.replace(opt)
  else
    a.push(opt)
  end
end

def replace_or_add_all(a, opts)
  opts.each { |opt| replace_or_add(a, opt) }
end

def remove_all(a, opts)
  opts.each do |opt|
    opt =~ /^x?[a-zA-Z]/i
    optch = $&
    a.delete_if { |o| o.index(optch) == 0 }
  end
end

def merge_style_flags(a, b)
  aset = a.scan(ASTYLE_RE)
  b.strip.split(/\s+/).each do |bopt|
    case bopt[0]
    when "-"
      replace_or_add_all(aset, bopt[1..-1].scan(ASTYLE_RE))
    when "+"
      remove_all(aset, bopt[1..-1].scan(ASTYLE_RE))
    else
      raise "Unrecognized option: #{bopt}"
    end
  end
  "-" + aset.join
end

def merge_options(a, b)
  opts = a.dup
  b.each do |key, val|
    case key
    when "astyle", "restyle"
      opts[key] = merge_style_flags(opts[key], val)
    else
      opts[key] = val
    end
  end
  opts
end

def get_content_options(content)
  opts = {}
  opt_re = /(astyle|restyle):\s*(.*)/
  comment_re = /(?:\/\/\s*#{opt_re}\s*$|\/\*\s*#{opt_re}\s*\*\/)/
  content.scan(opt_re) { |opt1,arg1,opt2,arg2| opts[opt1 || opt2] = arg1 || arg2 }
  opts
end

def load_dot_restyle(file)
  require 'yaml'
  YAML.parse_file(file).transform
end

def get_style_options(file)
  files = []
  path = File.expand_path(file)
  while ((superpath = File.dirname(path)) != path)
    if File.exist?(dot_restyle = File.join(superpath, ".restyle"))
      files << dot_restyle
    end
    path = superpath
  end
  opts = DEFAULT_OPTIONS
  files.reverse_each do |dot_restyle|
    opts = merge_options(opts, load_dot_restyle(dot_restyle))
  end
  return opts
end

# Restyle the contents of a file.
def restyle_file(file)
  opts = get_style_options(file)
  content = File.read(file, :encoding => ENCODING)
  if not $opts.force and opts["content_guard"] and not content.match(opts["content_guard"])
    log "Skipping #{file}"
    return
  end
  opts = merge_options(opts, get_content_options(content))
  
  orig_content = content.dup
  restyle(content)
  restyle_headerguards(content, file) if file =~ /\.(h|hpp|hxx)$/

  temp_file = File.join(ENV["TEMP"], "astyletemp")
  File.open(temp_file, "w") { |f| f << content }
  options = ASTYLE_OPTIONS + [opts["astyle"], temp_file]
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

EMPTY_LINE = /^(?:\s*)\n/

# Restyle a chunk of code (our own rule set)
def restyle(code)
  # Adjust copyright year
  year = Time.now.year
  code.gsub!(/Copyright \S+ ((\d+)(-\d+)?)/) { |m| "Copyright © #{year}" }
  # Exactly one newline at end of file
  code.gsub!(/(\S)\s*\z/m, "\\1\n")
  # Only 1 empty line between sections
  code.gsub!(/(\n[ \t]*\n)\s*\n/m, "\\1")
  # No empty lines after open-brace (if something is indented after)
  code.gsub!(/\{\s*^(\s+\S)\n/m, "{\n\\1")
  # No empty lines before close-brace (if something was intended before)
  code.gsub!(/^( +\S.*?\n)\s*(\n *\})/, "\\1\\2")
  # Centre lines in file header
  code.sub!(/\A\s*\/\/={54}\n(\/\/(.*\n))+?\/\/-{54}/) { |x|
    x.split("\n").map { |ln|
      ln.sub(/\A(\/\/)\s+(.*?)\s*\Z/) { 
        $1 + " " * ((54 - $2.size)/2) + $2
      }
    }.join("\n")
  }

  # /* comment */ to // comment
  code.gsub!(/\/\*(.*?)\*\/ *$/) { "// " + $1.strip }
  # Space after //
  code.gsub!(/\/\/([a-z0-9])/i, "// \\1")
  # Forward slashes in includes
  code.gsub!(/^(\s*#\s*include\s+["<])(.*?)([>"])/) { $1 + $2.tr('\\','/') + $3 }
  # At least one empty line before comments
  # code.gsub!(/#{EMPTY_LINE}*^(\s*\/(?:\/|\*))/, "\n\\1")
  code
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
  @skip_file_if_handlers << block
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
    if not File.file?(path)
      puts "#{path} is not a file"
      next
    end
    if path =~ FILENAME_PATTERN
      restyle_file(path)
    end
  end
  log "#{ARGV.size} file(s) processed"
end
