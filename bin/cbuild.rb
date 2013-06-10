#!/usr/bin/env ruby
require 'tempfile'
require 'trollop'
require 'fileutils'

opts = Trollop.options do
  opt :build_config, "Choose configuration to test", short: "-C", type: :string
  opt :rebuild, "Rebuild"
  opt :clean, "Clean"
  opt :pristine, "Remove all CMake related files"
  opt :verbose, "Verbose"
end

Trollop.die "Unexpected argument: #{ARGV.first}" unless ARGV.empty?

if opts.pristine
  globs = ["**/*.{vcproj,vcxproj,sln,dir,filters}", "**/{cmake_install.cmake,CMakeCache.txt,Win32,CMakeFiles,Debug,RelWithDebInfo,Release,RelMinSize}"]
  globs.each do |glob|
    Dir.glob(glob) do |path|
      puts "rm -rf #{path}"
      FileUtils.rm_rf(path)
    end
  end
  exit
end

cache = IO.read("CMakeCache.txt")
vars = Hash[*cache.scan(/^(\w+):(?:\w+)=(.*)$/).flatten]
generator = vars["CMAKE_GENERATOR"]
project_name = vars["CMAKE_PROJECT_NAME"]

def run_batch(cmds)
  tempfile = Tempfile.new(['cbuild', '.cmd'])
  tempfile << "@echo off\n"
  tempfile << "setlocal\n"
  tempfile << cmds << "\n"
  tempfile.close
  begin
    system "cmd", "/c", tempfile.path
  ensure
    tempfile.unlink
  end
end

extra_arg = ""

if generator =~ /Visual Studio/
  extra_arg << " /P:Configuration=#{opts.build_config}" if opts.build_config
  extra_arg << " /M"
  extra_arg << " /t:Clean" if opts.clean
  extra_arg << " /t:Rebuild" if opts.rebuild
end

if generator =~ /Makefiles/
  extra_arg << " clean" if opts.clean
  extra_arg << " VERBOSE=1"
end

case generator
when /Visual Studio (\d+)/
  run_batch "call \"%VS#{$1}0COMNTOOLS%vsvars32.bat\"\nmsbuild #{project_name}.sln#{extra_arg}"
when /MinGW Makefiles/
  system "mingw32-make clean #{extra_arg}" if opts.rebuild
  system "mingw32-make #{extra_arg}"
when /Makefiles/
  system "make clean #{extra_arg}" if opts.rebuild
  system "make #{extra_arg}"
end
