#!/usr/bin/env ruby
#
# Script that makes updating Visual Studio Solutions from CMakeLists'
# easier, by closing the solution via COM and automatically re-running
# CMake in the corresponding build directory, then reopening and
# building the solution.
#
# Simply run 'cmakevs.rb' from the command line, and it will find an
# instance of Visual Studio and detect the open solution and re-run
# CMake.
#
# Options to 'cmakevs.rb' will be passed on to CMake. This can be used
# to change build options (e.g. -DSOME_OPTION=ON/OFF).
#

require 'win32ole'
require 'tmpdir'

VSVARS = {
  "Visual Studio 9 2008" => "%VS90COMNTOOLS%\\vsvars32.bat",
  "Visual Studio 10" => "%VS100COMNTOOLS%\\vsvars32.bat",
  "Visual Studio 11" => "%VS110COMNTOOLS%\\vsvars32.bat",
  "Visual Studio 12" => "%VS120COMNTOOLS%\\vsvars32.bat"
}

def find_cmakecache(path)
  loop do
    cmakecache = File.join(path, "CMakeCache.txt")
    return path if File.exist?(cmakecache)
    parent_path = File.dirname(path)
    return nil if parent_path == path
    path = parent_path
  end
end

dte = WIN32OLE.connect("VisualStudio.DTE.10.0")
WIN32OLE.const_load(dte)
solution_path = dte.Solution.FileName
if solution_path.empty?
  puts "== No solution is open"
  exit 1
else
  solution_dir = File.dirname(solution_path)
  if path = find_cmakecache(solution_dir)
    Dir.chdir path do
      IO.read("CMakeCache.txt") =~ /^CMAKE_GENERATOR:INTERNAL=(.*)$/
      generator = $1
      if dte.Solution.SolutionBuild.BuildState == WIN32OLE::VsBuildStateInProgress
        puts "== Cancelling build"
        dte.ExecuteCommand("Build.Cancel")
        sleep 0.125 while dte.Solution.SolutionBuild.BuildState == WIN32OLE::VsBuildStateInProgress
      end
      puts "== Saving all documents"
      dte.Documents.SaveAll
      puts "== Closing solution (#{solution_path})"
      dte.Solution.Close
      puts "== Running CMake"

      batfile_path = File.join(Dir.tmpdir, "#{$$}-run-cmake.cmd")
      File.open batfile_path, "w" do |batfile|
        batfile.puts "@echo off"
        if env = VSVARS[generator]
          batfile.puts "call \"#{env}\""
        end
        batfile.puts ["cmake", ".", *ARGV].join(" ")
      end
      success = system("cmd", "/c", batfile_path)
      File.unlink(batfile_path)
      puts "== Opening solution"
      dte.Solution.Open(solution_path)
      if success
        puts "== Starting build"
        dte.ExecuteCommand("Build.BuildSolution")
      end
      puts "== Done"
    end
  else
    puts "== No CMakeCache.txt found in the solution path"
  end
end
