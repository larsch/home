#!/usr/bin/env ruby
#
# b - Build/source directory helper. Run any command from the source
# directory, and 'b' will create/find the build directory and run the
# command there.
#
# Installation:
#     Run: gem install trollop highline
#     Copy b.rb to somewhere in your PATH
#
# Example:
#    c:/users/me/projects/foobar> b
# Result:
#    'b' creates c:/build/foobar and configures cmake
#    'b' runs "cmake --build ." in c:/build/foobar
#
# Example:
#    c:/users/me/projects/foobar> b ctest -C Debug
# Result:
#    'b' runs "ctest -C Debug" in c:/build/foobar
#
# How it works:
#
# 'b' runs the command given on the command line (or the default
# command if none is given) in the build directories that corresponds
# to the current directory (assumed to be a source directory).  The
# default command is "cmake --build .", which is run if no arguments
# are given to b.
#
# The build directory is automatically created in the build root with
# the name of the source directory. b assumes that the current
# directory is the source directory, but will look for CMakeLists.txt
# files in parent directories to find the source root.
#
# Options:
#    --delete|-d       Delete build directory
#    --open|-o         Open Visual Studio Solution
#    --cmake|-c        Rerun CMake
#    --config|-C       Show b's configuration
#    --test|-t         Run CTest
#    --all|-a          Run Cmake, Build, and Test
#
# Configuration:
#    --set-build-root=<new build root>
#    --set-default-command=<default command>
#    --set-default-generator=<default cmake generator>

require 'fileutils'
require 'yaml'
require 'trollop'
require 'highline/import'

def query_path(prompt, default)
  loop do
    input = ask("#{prompt}: ") { |q| q.default = default }
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
  config["build_root"] ||= query_path("Build root", "C:/build")
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
def find_source_root(path = Dir.pwd)
  parent = File.dirname(path)
  if parent != path && root = find_source_root(parent)
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

# Select a generator
def select_generator
  return $DEFAULT_GENERATOR unless $DEFAULT_GENERATOR.nil?
  choose do |menu|
    menu.prompt = "Choose a generator: "
    menu.choices(*generators)
  end
end

# Get the generator to use
def generator
  config["default_generator"] || select_generator
end

# Print a command
def print_command(command)
  dir = Dir.pwd
  command = command.map { |x| x =~ / / ? "\"#{x}\"" : x }
  puts "\n#{dir.tr('/','\\')}>#{command.join(' ')}"
end

# Print and run a command
def run_command(*command)
  print_command command
  result = system *command
  if result.nil?
    puts "Failed to run command."
    exit 255
  elsif !result
    exit $?.exitstatus
  end
end

# Yes/no prompt
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

# Delete build directory
def delete_build
  source_dir, build_dir = find_dirs
  FileUtils.rm_rf(build_dir) if yesno("Delete #{build_dir}?", false)
end

# Open solution
def open_solution
  in_build do |source_dir|
    content = IO.read("CMakeCache.txt")
    project_name = content[/(?<=CMAKE_PROJECT_NAME:STATIC=).*$/]
    raise "Unable to identify project" unless project_name
    sln_path = project_name + ".sln"
    raise "Unable to find #{sln_path}" unless File.exist?(sln_path)
    system "start", sln_path
  end
end

# Find source and build directory
def find_dirs
  source_dir = find_source_root
  raise "CMakeLists.txt not found" unless source_dir
  build_dir = File.join(config["build_root"], File.basename(source_dir))
  return source_dir, build_dir
end

# Switch to build directory and yield to block
def in_build
  source_dir, build_dir = find_dirs
  FileUtils.mkdir_p(build_dir) unless File.directory?(build_dir)
  Dir.chdir build_dir do
    yield(source_dir)
  end
end

# Run command in build directory
def run_in_build(*args)
  in_build do |source_dir|
    run_command("cmake", "-G", select_generator, source_dir) unless File.exist?("CMakeCache.txt")
    args.push("cmake", "--build", ".") if args.empty?
    args.push("--target", $target) if $target
    args.push("--config", $config) if $config
    run_command(*args)
  end
end

def rerun_cmake(*args)
end

opts = Trollop.options do
  version "b 0.2"
  banner ""
  banner "Synopsis:"
  banner ""
  banner "  b                           Run default command"
  banner "  b ctest                     Run ctest"
  banner "  b cmake -DENABLE_OPT=ON .   Run cmake to change option"
  banner ""
  banner "Options:"
  opt :set_build_root, "Set build root (#{config["build_root"]})", type: String, short: :none
  opt :set_default_command, "Set default command (#{config["default_command"]})", type: String, short: :none
  opt :set_default_generator, "Set the default generator (#{config["default_generator"]}", type: String, short: :none
  opt :b_config, "Show configuration", short: '-b'
  opt :delete, "Delete everything in build directory", short: '-d'
  opt :open, "Open Solution", short: '-o'
  opt :cmake, "Rerun CMake", short: '-c'
  opt :all, "Rerun CMake, Build, Test", short: '-a'
  opt :test, "Rerun CTest", short: '-t'
  opt :generator, "Generator", short: '-G', type: String
  opt :config, "Build configuration", short: "-C", type: String
  opt :target, "Build target", type: String
  stop_on_unknown
end

changed_opt = false
if root = opts[:set_build_root]
  config["build_root"] = root
  changed_opt = true
end
if command = opts[:set_default_command]
  config["default_command"] = command
  changed_opt = true
end
if command = opts[:set_default_generator]
  config["default_generator"] = command
  changed_opt = true
end
if opts.b_config
  puts config.map { |pair| pair.join(': ') }.join("\n")
  exit
end
if changed_opt
  puts "Options changed"
  save_config
  exit
end

$DEFAULT_GENERATOR = opts.generator
$target = opts.target
$config = opts.config

if opts[:delete]
  delete_build
elsif opts[:open]
  open_solution
elsif opts[:cmake]
  in_build do |source_dir|
    run_command "cmake", "."
  end
elsif opts[:all]
  in_build do
    run_command "cmake", "."
    run_command "cmake", "--build", "."
    run_command "ctest", "-C", opts[:config] || "Debug"
  end
elsif opts[:test]
  in_build do
    run_command "ctest", "-C", opts[:config] || "Debug"
  end
else
  run_in_build(*ARGV)
end
