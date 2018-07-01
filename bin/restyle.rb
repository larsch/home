#!/usr/bin/env ruby
# encoding: iso-8859-1
#
# Restyle C/C++ code using AStyle and some additional cleaning up of
# whitespace, copyright notice, etc.
#

require "yaml"

FILENAME_PATTERN = /\.(h|c|cpp|hpp|cxx|hxx|c++|h++|ino)$/
ALL_GLOB = "**/*.{h,c,cpp,hpp,cxx,hxx,c++,h++,ino}"
ENCODING = "ISO-8859-1"
ASTYLE_EXECUTABLE = "astyle"
ASTYLE_OPTIONS = ["-q", "-A1Os3YHUjck1M60Km0"]
CONDITION_PATTERN = /Copyright/
ASTYLE_RE = /x?[a-zA-Z]\d*/
ASTYLE_FLAGS = "A1Os3YHUjck1M60EK".scan(ASTYLE_RE)

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
  content.scan(opt_re) { |opt1, arg1, opt2, arg2| opts[opt1 || opt2] = arg1 || arg2 }
  opts
end

def load_dot_restyle(file)
  require "yaml"
  YAML.parse_file(file).transform
end

def get_style_options(file, options)
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

def restyle_content(content, filename, opts)
  opts = merge_options(opts, get_content_options(content))
  restyle_code(content, File.expand_path(filename))
  restyle_headerguards(content, filename) if filename =~ /\.(h|hpp|hxx)$/
  temp_file = File.join(ENV["TEMP"], "astyletemp${$$}")
  File.open(temp_file, "w") { |f| f << content }
  options = ASTYLE_OPTIONS + [opts["astyle"], temp_file]
  system(ASTYLE_EXECUTABLE, *options)
  content = File.read(temp_file, :encoding => ENCODING)
  File.unlink(temp_file)
  return content
end

# Restyle the contents of a file.
def restyle_file(file)
  opts = get_style_options(file)
  content = File.read(file, :encoding => ENCODING)
  if not $opts.force and opts["content_guard"] and not content.match(opts["content_guard"])
    log "Skipping #{file}"
    return
  end

  orig_content = content.dup
  content = restyle_content(content, file, opts)

  temp_file = File.join(Dir.tmpdir, "astyletemp#{$$}")
  File.open(temp_file, "w") { |f| f << content }
  astyle_options = Shellwords.shellwords(options["astyle_options"])
  argv = astyle_options + [temp_file]
  astyle = options["astyle_executable"]
  system(astyle, *argv) or fail("Failed to execute #{astyle} #{options.inspect} #{$?}")

  content = File.read(temp_file, :encoding => options["encoding"])
  File.unlink(temp_file)

  post_restyle_code(content, File.expand_path(file))

  if orig_content != content
    update_copyright_without_year(content) unless $opts.check or options["leave_copyright"]
    @changed_files += 1
    if $opts.diff
      Dir.mktmpdir do |tmppath|
        tempfile = File.join(tmppath, File.basename(file))
        File.open(tempfile, "w") { |f| f << content }
        system "diff", "-u", file, tempfile
      end
    elsif $opts.check
      puts "X #{file}"
    else
      File.open(file, "w") { |f| f << content }
      log "Restyled #{file}"
    end
  else
    @unchanged_files += 1
  end
end

EMPTY_LINE = /^(?:\s*)\n/

# Restyle a chunk of code (our own rule set)
def restyle_code(code, path, options)
  # Adjust copyright year
  year = Time.now.year.to_s
  code.gsub!(/Copyright \S+ (?:(\d+)(-\d+)*)/) do |m|
    old_start = $1
    year = "#{old_start}-#{year}" if old_start != year
    "Copyright � #{year}"
  end

  # Exactly one newline at end of file
  code.gsub!(/(\S)\s*\z/m, "\\1\n")

  # Only 1 empty line between sections
  code.gsub!(/(\n[ \t]*\n)\s*\n/m, "\\1")

  # No empty lines after open-brace
  code.gsub!(/(?<!@){\s*\n/m, "{\n")

  # No empty lines before close-brace
  code.gsub!(/\s*(\n *\})/, "\\1")

  # Centre lines in file header
  code.sub!(/\A\s*\/\/={54}\n(\/\/(.*\n))+?\/\/-{54}/) { |x|
    x.split("\n").map { |ln|
      ln.sub(/\A(\/\/)\s+(.*?)\s*\Z/) {
        $1 + " " * [((54 - $2.size) / 2), 0].max + $2
      }
    }.join("\n")
  }

  # Remove empty lines and whitespace before file header
  code.sub!(/\A\s*/, "")

  # At least one space after C++ style comment markers (//)
  code.gsub!(/(^| +)\/\/(?!lint)([a-z0-9])/i, "\\1// \\2")

  # Forward slashes in includes
  code.gsub!(/^(\s*#\s*include\s+["<])(.*?)([>"])/) { $1 + $2.tr('\\', "/") + $3 }

  # One empty line after } at outermost level
  code.gsub!(/^}\n(\w)/, "}\n\n\\1")

  # Changed include "" to include <> if file is not found locally
  unless $opts.single
    code.gsub!(/^(\s*#\s*include\s+)"(.*)"/) do
      local = File.join(File.dirname(path), $2)
      if File.exist?(local)
        $&
      else
        "#{$1}<#{$2}>"
      end
    end
  end

  # Strip old CVS keywords
  remove_tags = ["Revision", "Date", "Author"].join("|")
  code.gsub!(/^.*\$(#{remove_tags}):.*$.*\n/, "")

  # Remove duplicate //--- lines
  code.gsub!(/(^\/\/-+\n)(^\/\/-+\n)+/, "\\1")
end

def post_restyle_code(code, path)
  # Fix Astyle 2.02/2.03 bad indentation of comments in enums
  code.replace enum_fix(code.lines).join
end

# Fix Astyle 2.02/2.03 bad indentation of comments in enums.
def enum_fix(lines)
  indent = enum_indent = nil
  lines.map do |ln|
    if ln =~ /^(\s*)$/
    elsif ln =~ /^(\s*)enum\s*/
      indent = $1
    elsif indent && ln =~ /^#{indent}{/
      enum_indent = indent + "   "
      indent = nil
    elsif enum_indent && ln.sub!(/^#{enum_indent}\s*/, enum_indent)
      # Edited
    else
      indent = enum_indent = nil
    end
    ln
  end
end

def update_copyright_with_year(code)
  # Adjust copyright year
  year = Time.now.year.to_s
  code.gsub!(/Copyright \S+ (?:(\d+)(-\d+)*)/) do |m|
    old_start = $1
    year = "#{old_start}-#{year}" if old_start != year
    "Copyright (C) #{year}"
  end
end

def update_copyright_without_year(code)
  # Adjust copyright year
  year = Time.now.year.to_s
  code.gsub!(/Copyright \S+ (?:(\d+)(-\d+)*)/) do |m|
    "Copyright (C)"
  end
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
      hgpath = path[basedir.size + 1..-1]
      break
    elsif File.exist?(File.join(lastbasedir, "CMakeLists.txt")) or File.exist?(File.join(lastbasedir, "..", "changes.txt"))
      hgpath = path[File.dirname(basedir).size + 1..-1]
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
      stack.push [[i, $1]]
    when /^\s*\#\s*define (\w+)$/
      stack.last[1] ||= [i, $1] unless stack.empty?
    when /^\s*\#\s*endif\s*(.*)$/
      groups.push stack.pop + [[i, $1]]
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

    # Adjust empty lines before and after header guards
    before = lines[0...last[0][0]]
    guard1 = lines[last[0][0]..last[1][0]]
    middle = lines[last[1][0] + 1...last[2][0]]
    guard2 = lines[last[2][0], 1]
    after = lines[last[2][0] + 1..-1]
    before.pop while middle.last && before.last.strip.empty?; before.push ""
    middle.shift while middle.first && middle.first.strip.empty?; middle.unshift ""
    middle.pop while middle.last && middle.last.strip.empty?; middle.push ""
    lines = [before, guard1, middle, guard2, after].flatten
  else
  end
  content.replace(lines.join("\n") + "\n")
end

def skip_file(content)
  content !~ @source_pattern
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
  attr_accessor :all
  attr_accessor :force
  attr_accessor :verbose
  attr_accessor :diff
  attr_accessor :filelog
  attr_accessor :dirty
  attr_accessor :cached
  attr_accessor :check
  attr_accessor :single
  attr_accessor :filename_pattern
  attr_accessor :source_pattern

  def initialize
    @force = false
    @verbose = false
    @diff = false
    @filelog = false
    @dirty = false
    @cached = false
    @check = false
    @single = false
    @filename_pattern = FILENAME_PATTERN
    @source_pattern = CONDITION_PATTERN
  end
end

def print_usage
  puts "Usage: #{File.basename($0)} [OPTION]... [FILE-PATTERN] ..."
  puts "Restyle GateHouse source code"
  puts "Example: #{File.basename($0)} --dirty"
  puts
  puts "Files:"
  puts "  --all/-a       Restyle all files (cpp,c,h) found in current directory and below"
  puts "  --dirty        Restyle all dirty files that are in CVS or tracked in Git"
  puts "  --cached       Restyle all cached file in the Git index"
  puts "  path/*.{c,h}   All c,h files in path"
  puts "  path/**/*.cpp  All cpp files in path and below (recursively)."
  puts
  puts "Behaviour:"
  puts "  --check/-c     Check that all source files are formatted properly"
  puts "  --diff/-d      Show the change that would be done, but don't actually write them"
  puts "  --force/-f     Force: restyle files that would normally be skipped"
  puts "  --pattern/-p   Only process files that contain this pattern (Default: #{@source_pattern.inspect})"
  puts "  --single/-s    Check only a single file, do not look for other files in file system"
  puts "  --leave-copy   Leave copyright mark untouched"
  puts
  puts "Miscellaneous:"
  puts "  --help/-?/-h   Show this information"
  puts "  --show-options Show current options"
  puts "  --verbose/-v   Be verbose"
  puts
end

def get_options(options)
  opts = Options.new
  files = []
  while arg = ARGV.shift
    case arg
    when "--check", "-c"
      opts.check = true
    when "--force", "-f"
      opts.force = true
    when "--edited", "-e", "--dirty"
      opts.dirty = true
    when "--cached"
      opts.cached = true
    when "--all", "-a"
      files.push options["all"]
    when "--verbose", "-v"
      opts.verbose = true
    when "--diff", "-d"
      opts.diff = true
    when "--pattern", "-p"
      options.source_pattern = eval(ARGV.shift)
    when "--single", "-s"
      opts.single = true
    when "--leave-copy"
      options["leave_copyright"] = true
    when "--show-options"
      puts options.to_yaml
      exit 0
    when "--help", "-h", "-?"
      print_usage
      exit 1
    when /^-/
      puts "Unknown option: #{arg}"
      exit 1
    else
      files.push(arg)
    end
  end
  ARGV.replace(files)
  return opts
end

def git_status
  statuses = `git status -z`.split("\x00")
  while status = statuses.shift
    mode = status[0..1]
    path = status[3..-1]
    old_path = statuses.shift if mode[0] == "R"
    yield mode, path
  end
end

def git_status_files
  files = []
  git_status do |mode, path|
    files << path if yield(mode, path)
  end
  return files
end

def git_dirty_files
  git_status_files { |mode, path| path =~ @filename_pattern && mode[1] == "M" || mode[1] == "R" }
end

def git_cached_files
  git_status_files { |mode, path| path =~ @filename_pattern && mode[0] == "M" || mode[0] == "R" }
end

def find_dot_style(path = Dir.pwd)
  loop do
    style_path = File.join(path, ".style")
    return style_path if File.file?(style_path)
    next_path = File.dirname(path)
    break if next_path == path
    path = next_path
  end
end

if __FILE__ == $0
  $opts = get_options(@options)
  require "pp"
  pp opts: $opts
  pp options: @options

  @filename_pattern = $opts.filename_pattern
  @source_pattern = $opts.source_pattern

  # Load tmpdir conditionally (bit more responsive in VS macro)
  require "tmpdir" if $opts.diff

  if $opts.dirty
    if File.exist?("CVS")
      require File.join(File.dirname(__FILE__), "edited")
      each_edited_file { |path| ARGV.push(path) if path =~ /\.(h|cpp|c)$/ }
    elsif File.exist?(".git")
      ARGV.push(*git_dirty_files)
    end
  end

  if $opts.cached
    if File.exist? ".git"
      ARGV.push(*git_cached_files)
    end
  end

  files = ARGV.map do |glob|
    result = Dir.glob(glob.tr('\\', "/"))
    if result.empty?
      puts "#{glob} does not exist."
      exit 1
    end
    result
  end.flatten

  if files.empty?
    puts "No files to process."
    exit 1
  end

  # Replace directory names with their contents
  files.map! do |path|
    if File.directory?(path)
      Dir.glob(File.join(path, ALL_GLOB))
    else
      path
    end
  end
  files.flatten!

  p files

  orig_options = @options.dup
  path_option_cache = {}

  files.sort.each do |path|
    if style_path = find_dot_style(File.dirname(path))
      path_options = (path_option_cache[style_path] ||= YAML.load_file(style_path))
      options = orig_options.merge(path_options)
    else
      options = orig_options
    end

    puts path if $opts.verbose
    if not File.file?(path)
      puts "#{path} is not a file"
      next
    end
    if path =~ @filename_pattern
      p @options
      restyle_file(path)
    end
  end

  log "#{ARGV.size} file(s) processed"
  if $opts.check || $opts.diff
    exit(@changed_files == 0 ? 0 : 1)
  end
end
