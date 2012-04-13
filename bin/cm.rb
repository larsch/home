#!/usr/bin/env ruby
#
# Updates CMakeLists.txt with all source files found in the current
# hierachy. Creates two variables, 'sources' and 'headers'.

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

def header_template(fn)
  hg = header_guard(fn)
  "#{header_comment(fn)}\n\n#ifndef #{hg}\n#define #{hg}\n\n\n#endif // #{hg}\n"
end

def source_template(fn)
  headerfilename = fn.sub(/\.[^.]+$/, '.h')
  "#{header_comment(fn)}\n\n#include \"#{headerfilename}\""
end

def create(fn, content = "")
  if File.exist?(fn)
    puts "Not overwriting #{fn}"
  else
    puts "Creating #{fn}"
    File.open(fn, "w") { |f| f << content }
  end
end

def add(fn)
  case fn
  when /\.h(pp|xx)?$/
    create(fn, header_template(fn))
  when /\.c(pp|xx)?$/
    create(fn, source_template(fn))
  when /\./
    create(fn)
  else
    add(fn + ".h")
    add(fn + ".cpp")
  end
end

while arg = ARGV.shift
  case arg
  when '-a'
    add(ARGV.shift)
  when '-f'
    $force = true      
  else
    puts "Unknown option: #{arg}"
    exit 1
  end
end

def has_cmakelists(path)
  cmakelists = File.join(path, "CMakeLists.txt")
  return false if path.empty? or path == "."
  return true if File.exist?(cmakelists)
  return has_cmakelists(File.dirname(path))
end

sources = Dir["**/*.{cpp,c,cxx}"].sort
headers = Dir["**/*.{h,hpp,hxx}"].sort
sources.delete_if { |fn| fn =~ /^test\// }
headers.delete_if { |fn| fn =~ /^test\// }
sources.delete_if { |path| has_cmakelists(path) }
headers.delete_if { |path| has_cmakelists(path) }

def set(var, list)
  files = list.join("\n  ")
  "set(#{var} #{files})"
end

def source_group(group, list)
  files = list.map{|path| path.tr('\\','/')}.join("\n  ")
  "source_group(#{group} FILES #{files})"
end
  
if File.exist?("CMakeLists.txt")
  content = File.read("CMakeLists.txt")
else
  project = File.basename(File.expand_path(Dir.pwd))
  if project == "test"
    above = File.basename(File.dirname(File.expand_path(Dir.pwd)))
    project = "#{above}_#{project}"
  end
  content = "cmake_minimum_required(VERSION 2.6)\nproject(#{project})\nset(sources)\nset(headers)\nadd_library(#{project} ${sources} ${headers})\nsource_groups_by_path(#{project})\n"
end

orig_content = content.dup

# Ensure we have a newline at the end of the file
content.gsub!(/\n*\z/, "\n")

set_headers = set("headers", headers)
if not content.gsub!(/^SET\(headers.*?\)$/im, set_headers)
  content << set_headers << "\n"
end
set_sources = set("sources", sources)
if not content.gsub!(/^SET\(sources.*?\)$/im, set_sources)
  content << set_sources << "\n"
end

all = (sources + headers).sort
sourcegroups = {}
all.each { |filename|
  dirname = File.dirname(filename)
  if dirname == '.'
    sourcegroup = "\"\""
  else
    sourcegroup = dirname.gsub('/') { "\\\\" }
  end
  sourcegroups[sourcegroup] ||= []
  sourcegroups[sourcegroup] << filename
}

Dir.foreach "." do |entry|
  next if entry == "." or entry == ".."
  if File.directory?(entry)
    if File.exist?(File.join(entry, "CMakeLists.txt"))
      if content !~ /add_subdirectory\(#{entry}\)/
        content << "add_subdirectory(#{entry})\n"
        puts "+ add_subdirectory(#{entry})"
      end
    end
  end
end

if $force or content != orig_content
  puts "Updating CMakeLists.txt"
  File.open("CMakeLists.txt", "w") do |cmakelist|
    cmakelist << content
  end
else
  puts "No changes."
end

