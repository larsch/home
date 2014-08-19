
#!/usr/bin/env ruby
#
# CMakeLists.txt semi-auto-editor. Synchronizes the list of files in a
# directory with the contents of a CMakeLists.txt file.
#
# Two variables, 'sources' and 'headers' are assumed to list all
# source and header files. By default, these are updated to include
# all files found. Other files that are listed in any set(),
# add_library() or add_executable() target are ignored. Subdirectories
# are included, unless they have their own CMakeLists.txt.
#
# New files can be added using the '-a' option, e.g. "cm -a
# MyNewClass" to create a new pair of .h/.cpp files.

require 'shellwords'
require 'erb'

HEADER_REGEXP = /\.(?:h|hpp|hxx|H)$/
SOURCE_REGEXP = /\.(?:c|cpp|cxx|C)$/
ANY_REGEXP = /\.(?:c|cpp|cxx|C|h|hpp|hxx|H)$/

def quote(list)
  list.map do |x|
    if x =~ /[\" ]/
      '"' + x.gsub('"', '\\"') + '"'
    else
      x
    end
  end
end

def cmakejoin(list)
  quote(list).join("\n  ")
end

class Item
  attr_accessor :command, :key, :list
  def modified?
    @modified
  end
  def initialize(command, key, list)
    @command = command
    @key = key
    @list = list
    @modified = false
  end
  def add(file)
    puts "Adding #{file} to #{key}"
    @list.push(file)
    @modified = true
  end
  def known?(item)
    @list.include?(item)
  end
  def to_s
    sorted_list = list.sort_by { |x| x.downcase }
    "#{command}(#{key} #{cmakejoin sorted_list})"
  end
  def delete_missing(items)
    list.delete_if do |path|
      if items.include?(path) || path =~ /\$\{/ || path =~ /^(WIN32|MACOSX_BUNDLE|EXCLUDE_FROM_ALL)$/
        false
      else
        puts "Removing #{path} from #{key}"
        @modified = true
        true
      end
    end
  end
end

class CMakeLists

  def initialize
    if File.exist?("CMakeLists.txt")
      @content = IO.read("CMakeLists.txt")
    else
      project = File.basename(Dir.pwd)
      @content = "cmake_minimum_required(VERSION 2.8)\nproject(#{project})\nset(sources)\nset(headers)\nadd_library(#{project} ${sources} ${headers})\n"
    end
    @orig_content = @content.dup
    @variables = {}
    @targets = {}
    @content.scan /\b(set|add_library|add_executable)\b\s*\(\s*(\w+)\b(.*?)\)/m do ||
        command = $1
      key = $2
      value = $3
      item = Item.new(command, key, Shellwords.shellsplit(value))
      case command
      when "set"
        @variables[key] = item
      when /^add_/
        @targets[key] = item
      end
    end
  end

  def commit
    @variables.each do |key, item|
      if item.modified?
        if !@content.gsub!(/\bset\b\s*\(\s*#{key}\b.*?\)/m, item.to_s)
          p :failed
        end
      end
    end
    @targets.each do |key, item|
      if item.modified?
        if !@content.gsub!(/\badd_(library|executable)\b\s*\(\s*#{key}\b.*?\)/m, item.to_s)
          p :failed
        end
      end
    end
  end

  def save
    whitespace_cleanup
    if @content != @orig_content
      File.open("CMakeLists.txt", "w") do |io|
        io.write(@content)
      end
      puts "CMakeLists.txt updated"
    else
      puts "No changes"
    end
  end

  def whitespace_cleanup
    @content.gsub!(/^\A\s+/, '') # White-space at start of file
    @content.gsub!(/\s+$/, '') # White-space at end of lines
    @content.gsub!(/\s*\z/, "\n") # White-space at end of file
  end

  def add(filename)
    if filename =~ HEADER_REGEXP
      add_header(filename)
    elsif filename =~ SOURCE_REGEXP
      add_source(filename)
    else
      raise "Don't know how to handle #{filename}"
    end
  end

  def add_source(filename)
    if sources = @variables["sources"]
      sources.add(filename)
    else
      raise "No 'sources' variable found in CMakeLists.txt"
    end
  end

  def add_header(filename)
    if headers = @variables["headers"]
      headers.add(filename)
    else
      raise "No 'headers' variable found in CMakeLists.txt"
    end
  end

  def find_sources_and_headers(path = ".")
    result = []
    Dir.foreach(path) do |entry|
      next if entry == "." || entry == ".."
      fullpath = File.join(path, entry)
      if File.file?(fullpath)
        sanepath = fullpath.sub(/^.\//, '')
        result.push(sanepath) if fullpath =~ ANY_REGEXP
      elsif File.directory?(fullpath)
        cml = File.join(fullpath, "CMakeLists.txt")
        result.concat(find_sources_and_headers(fullpath)) unless File.exist?(cml)
      end
    end
    return result
  end

  def known?(file)
    @variables.each do |name, item|
      return true if item.known?(file)
    end
    @targets.each do |name, item|
      return true if item.known?(file)
    end
    return false
  end

  def delete_missing(files)
    if sources = @variables["sources"]
      sources.delete_missing(files)
    end
    if headers = @variables["headers"]
      headers.delete_missing(files)
    end
    @targets.each do |name, item|
      item.delete_missing(files)
    end
  end

  def sync(path = ".")
    all = find_sources_and_headers
    delete_missing(all)
    all.each do |path|
      unless known?(path)
        puts "Adding #{path}"
        add(path)
      end
    end
  end

  def header_guard(fn)
    "_" + File.basename(fn).gsub(/[^0-9a-z]/i, '_')
  end

  def header_comment(fn)
    file = File.expand_path("~/.header_comment")
    if File.exist?(file)
      File.read(file)
    else
      ""
    end
  end

  def template(tmpl, filename)
    name = File.basename(filename, File.extname(filename))
    literalname = name.gsub(/([a-z])([A-Z])/, "\\1 \\2")
    modulename = File.basename(File.dirname(File.expand_path(filename)))
    ERB.new(tmpl).result(binding)
  end

  def header_template(fn)
    template(IO.read(File.expand_path "~/.templates/file.h"), fn)
    # hg = header_guard(fn)
    # "#{header_comment(fn)}\n\n#ifndef #{hg}\n#define #{hg}\n\n\n#endif // #{hg}\n"
  end

  def source_template(fn)
    template(IO.read(File.expand_path "~/.templates/file.cpp"), fn)
    # "#{header_comment(fn)}\n\n#include \"#{headerfilename}\""
  end

  def create(fn, content = "")
    if File.exist?(fn)
      puts "Not overwriting #{fn}"
    else
      puts "Creating #{fn}"
      File.open(fn, "w") { |f| f << content }
    end
  end

  def smart_add(fn)
    case fn
    when HEADER_REGEXP
      create(fn, header_template(fn))
    when SOURCE_REGEXP
      create(fn, source_template(fn))
    when /\./ # has extension
      create(fn)
    else
      smart_add(fn + ".h")
      smart_add(fn + ".cpp")
    end
  end

  def git?(path = Dir.pwd)
    if File.directory?(File.join(path, ".git"))
      true
    else
      parent = File.dirname(path)
      if parent == path
        false
      else
        git?(parent)
      end
    end
  end

  def try_rename_file(a, b)
    if File.exist?(a)
      if File.exist?(b) && a.downcase != b.downcase
        puts "Not renaming #{a} to #{b} (target already exists)"
      else
        puts "Rename #{a} #{b}"
        if git?
          system("git", "mv", "-f", a, b) or fail("Failed to rename")
        else
          File.rename(a, b)
        end
      end
    end
  end

  def rename(a, b)
    try_rename_file(a + ".h", b + ".h")
    try_rename_file(a + ".cpp", b + ".cpp")
    try_rename_file(a + ".c", b + ".c")
  end
end

cml = CMakeLists.new
unless ARGV.empty?
  while arg = ARGV.shift
    case arg
    when "-a"
      cml.smart_add(ARGV.shift)
    when "-r"
      cml.rename(ARGV.shift, ARGV.shift)
    else
      raise "Unknown option #{arg}"
    end
  end
end
cml.sync
cml.commit
cml.save
