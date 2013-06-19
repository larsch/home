#!/usr/bin/env ruby
require 'tempfile'
require 'trollop'
require 'fileutils'

# Detect the number of processors available. (Thanks to grosser at
# Stack Overflow for this:
# http://stackoverflow.com/questions/891537/ruby-detect-number-of-cpus-installed)
def maxcpucount
  case RbConfig::CONFIG['host_os']
  when /darwin9/
    `hwprefs cpu_count`.to_i
  when /darwin/
    ((`which hwprefs` != '') ? `hwprefs thread_count` : `sysctl -n hw.ncpu`).to_i
  when /linux/
    `cat /proc/cpuinfo | grep processor | wc -l`.to_i
  when /freebsd/
    `sysctl -n hw.ncpu`.to_i
  when /mswin|mingw/
    require 'win32ole'
    wmi = WIN32OLE.connect("winmgmts://")
    cpu = wmi.ExecQuery("select NumberOfLogicalProcessors from Win32_Processor")
    cpu.to_enum.first.NumberOfLogicalProcessors
  end
end

opts = Trollop.options do
  banner "Usage:"
  banner "   cbuild [options] [target ...]"
  banner ""
  banner "Options:"
  opt :build_config, "Choose configuration to test", short: "-C", type: :string
  opt :rebuild, "Rebuild"
  opt :clean, "Clean"
  opt :pristine, "Remove all CMake related files"
  opt :verbose, "Verbose"
  opt :maxcpucount, "Maximum CPUs to utilize (default = all)", type: :int, default: 0
end

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
  if opts.maxcpucount == 0
    extra_arg << " /M"
  elsif opts.maxcpucount > 1
    extra_arg << " /M:#{opts.maxcpucount}"
  end
  extra_arg << " /t:Clean" if opts.clean
  extra_arg << " /t:Rebuild" if opts.rebuild
  extra_arg << " /verbosity:minimal" unless opts.verbose
  extra_arg << " /nologo" unless opts.verbose
  extra_arg << ARGV.map { |arg| " /t:#{arg}" }.join
end

if generator =~ /Makefiles/
  extra_arg << " clean" if opts.clean
  extra_arg << " VERBOSE=1" if opts.verbose
  if opts.maxcpucount == 0
    extra_arg << " -j#{maxcpucount}"
  elsif opts.maxcpucount > 1
    extra_arg << " -j#{opts.maxcpucount}"
  end
end

case generator
when /Visual Studio (\d+)/
  run_batch "call \"%VS#{$1}0COMNTOOLS%vsvars32.bat\" >NUL\nmsbuild #{project_name}.sln#{extra_arg}"
when /MinGW Makefiles/
  system "mingw32-make clean #{extra_arg}" if opts.rebuild
  system "mingw32-make #{extra_arg}"
when /Makefiles/
  system "make clean #{extra_arg}" if opts.rebuild
  system "make #{extra_arg}"
end
