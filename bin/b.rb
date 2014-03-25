#!/usr/bin/env ruby
#
# b - a cmake convinience tool
#
# Runs build commands (e.g. cmake --build ., ctest, etc) in the
# corresponding build directory, from the source directory. For
# example, this command automatically starts a build in the associated
# build directory:
#
#   c:\source\git\repo> b
#
#   c:\build\git\repo> cmake --build .  (Automatic)
#
# Other commands can be run by passing them to 'b':
#
#   c:\source\git\repo> b ctest
#
#   c:\build\git\repo> ctest

require 'fileutils'
require 'yaml'
require 'trollop'
require 'highline/import'

def query(prompt, default)
  print "#{prompt} [#{default}]: "
  input = STDIN.gets.chomp
  if input.empty?
    return default
  else
    return input
  end
end

def query_path(prompt, default)
  loop do
    input = query(prompt, default)
    if File.directory?(input)
      return input
    else
      puts "#{input} is not a directory."
    end
  end
end

def make_config
  dot_b = File.expand_path("~/.b")
  if File.exist?(dot_b)
    config = YAML.load_file(dot_b)
  else
    config = {}
  end
  @orig_config = config.dup
  config["source_root"] ||= query_path("Source root", File.dirname(Dir.pwd))
  config["build_root"] ||= query_path("Build root", "C:/build/git")
  config["default_command"] ||= "cmake --build ."
  save_config(config)
  return config
end

def save_config(config = config)
  dot_b = File.expand_path("~/.b")
  if @orig_config != config
    open dot_b, "w" do |io|
      io << YAML.dump(config)
    end
  end
end

def config
  @config ||= make_config
end

# Find the top level CMake project directory, i.e. the highest level
# directory that contains a CMakeLists.txt.
def find_root(path = Dir.pwd)
  parent = File.dirname(path)
  if parent != path && root = find_root(parent)
    return root
  end
  cmakelists = File.join(path, "CMakeLists.txt")
  return path if File.exist?(cmakelists)
end

# Detect the generators supported by the installed version of CMake.
def generators
  generators = []
  section_found = false
  `cmake --help`.each_line do |line|
    section_found = true if line =~ /^Generators/
    next unless section_found
    generators << $1 if line =~ /^  (\S.*?)\s*(=|$)/
  end
  return generators
end

def select_generator
  gens = generators
  gens.each_with_index do |gen, i|
    printf "%2d) %s\n", i+1, gen
  end
  loop do
    printf "> "
    gen_i = STDIN.gets.to_i
    if gen_i >= 1 || gen_i <= gens.size
      return gens[gen_i-1]
    else
      puts "Out of range"
    end
  end
end

def print_command(dir, command)
  puts "\n#{dir.tr('/','\\')}>#{command.join(' ')}"
end

def run_command(dir, *command)
  print_command dir, command
  result = system *command
  if result.nil?
    puts "Execution failed."
    exit 1
  end
end

def yesno(prompt = "Continue?", default = true)
  a = ''
  s = default ? '[Y/n]' : '[y/N]'
  d = default ? 'y' : 'n'
  until %w[y n].include? a
    a = ask("#{prompt} #{s} ") { |q| q.limit = 1; q.case = :downcase }
    a = d if a.length == 0
  end
  a == 'y'
end

def delete_build(build_root)
  source_dir = find_root
  build_dir = File.join(build_root, File.basename(source_dir))
  if yesno("Delete #{build_dir}?", false)
    FileUtils.rm_rf(build_dir)
  end
end

def open_solution(build_root)
  source_dir = find_root
  build_dir = File.join(build_root, File.basename(source_dir))
  Dir.chdir build_dir do
    content = IO.read("CMakeCache.txt")
    project_name = content[/(?<=CMAKE_PROJECT_NAME:STATIC=).*$/]
    raise "Unable to identify project" unless project_name
    sln_path = project_name + ".sln"
    raise "Unable to find #{sln_path}" unless File.exist?(sln_path)
    system "start", sln_path
  end
end

def in_build(build_root, args)
  source_dir = find_root
  build_dir = File.join(build_root, File.basename(source_dir))
  FileUtils.mkdir_p(build_dir) unless File.directory?(build_dir)
  Dir.chdir build_dir do
    unless File.exist?("CMakeCache.txt")
      run_command build_dir, "cmake", "-G", select_generator, source_dir
    end
    if args.empty?
      args.push "cmake", "--build", "."
    end
    run_command build_dir, *args
  end
end

opts = Trollop.options do
  version "b 0.1"
  banner ""
  banner "Synopsis:"
  banner ""
  banner "  b                           Run default command"
  banner "  b ctest                     Run ctest"
  banner "  b cmake -DENABLE_OPT=ON .   Run cmake to change option"
  banner ""
  banner "Options:"
  opt :set_build_root, "Set build root (#{config["build_root"]})", type: String
  opt :set_source_root, "Set source root (#{config["source_root"]})", type: String
  opt :set_default_command, "Set default command (#{config["default_command"]})", type: String
  opt :config, "Show configuration"
  opt :delete, "Delete everything in build directory"
  opt :open, "Open Solution"
  stop_on_unknown
end

changed_opt = false
if root = opts[:set_build_root]
  config["build_root"] = root
  changed_opt = true
end
if root = opts[:set_source_root]
  config["source_root"] = root
  changed_opt = true
end
if command = opts[:set_default_command]
  config["default_command"] = command
  changed_opt = true
end
if opts.config
  puts config.map { |pair| pair.join(': ') }.join("\n")
  exit
end
if changed_opt
  p config
  save_config
  exit
end

if opts[:delete]
  delete_build(config["build_root"])
elsif opts[:open]
  open_solution(config["build_root"])
else
  in_build(config["build_root"], ARGV)
end
