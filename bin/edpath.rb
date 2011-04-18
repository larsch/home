#!/usr/bin/env ruby
require 'win32/registry'
require 'yaml'
require 'pp'
require 'win32/api'
require 'windows/window/message'

SystemVariables = "System Variables"
UserVariables = "User Variables"

class NoChanges < Exception
end

class InvalidFormat < Exception
end

class InvalidPaths < Exception
end

def load_paths
  env = {}
  Win32::Registry::HKEY_LOCAL_MACHINE.open('SYSTEM\CurrentControlSet\Control\Session Manager\Environment') do |reg|
    begin
      env[SystemVariables] = reg['Path'].split(File::PATH_SEPARATOR)
    rescue Win32::Registry::Error
      env[SystemVariables] = []
    end
  end
  Win32::Registry::HKEY_CURRENT_USER.open('Environment') do |reg|
    env[UserVariables] = reg['Path'].split(File::PATH_SEPARATOR)
  end
  return env
end

def store_paths(paths)
  Win32::Registry::HKEY_LOCAL_MACHINE.open('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', Win32::Registry::KEY_WRITE) do |reg|
    reg['Path'] = paths[SystemVariables].join(File::PATH_SEPARATOR)
  end
  Win32::Registry::HKEY_CURRENT_USER.open('Environment', Win32::Registry::KEY_WRITE) do |reg|
    reg['Path'] = paths[UserVariables].join(File::PATH_SEPARATOR)
  end
  sendmessage = Win32::API.new('SendMessageTimeout', 'LILPLLP', 'L', 'user32')
  sendmessage.call(0xFFFF, Windows::Window::Message::WM_SETTINGCHANGE, 0, 'Environment', 0x0002, 2, 0)
end

def validate_paths(paths)
  raise "Unexpected content in results" if paths.size > 2
  raise "Missing key #{UserVariables}" unless paths.has_key?(UserVariables)
  raise "Missing key #{SystemVariables}" unless paths.has_key?(SystemVariables)
  user_paths = paths[UserVariables]
  system_paths = paths[SystemVariables]
  raise "#{UserVariables} not an array" unless user_paths.is_a?(Array)
  raise "#{SystemVariables} not an array" unless system_paths.is_a?(Array)

  success = true
  [user_paths,system_paths].flatten.each do |path|
    if not File.directory?(path)
      puts "#{path} is not a directory"
      success = false
    end
  end
  raise InvalidPaths unless success
end

def edit_content(content)
  file = File.join(ENV['TEMP'], "paths.txt")
  File.open(file, "w") do |io|
    io << content
  end
  system("start /wait notepad.exe \"#{file}\"")
  newcontent = File.read(file)
  raise NoChanges if newcontent == content
  return newcontent
end

def edit_paths(paths)
  content = paths.to_yaml
  begin
    content = edit_content(content)
    paths = YAML.parse(content).transform
    validate_paths(paths)
  rescue InvalidPaths
    retry
  end
  return paths
end

=begin
def valid_path?(path)
  success = true
  path.split(File::PATH_SEPARATOR).each do |part|
    if not File.directory?(part)
      puts "#{part} is not a directory"
      success = false
    end
  end
  return success
end

if pathenv[SystemVariables] != newpathenv[SystemVariables]
  newsystempath = newpathenv[SystemVariables].join(File::PATH_SEPARATOR)
  exit if not valid_path?(newpathenv)
  puts "Change to:"
  puts newsystempath
else
  p :nochange
end

if pathenv[UserVariables] != newpathenv[UserVariables]
  userpath = newpathenv[UserVariables].join(File::PATH_SEPARATOR)
  exit if not valid_path?(userpath)
  puts "Change to:"
  puts userpath
else
  p :nochange
end
=end


paths = load_paths
begin
  paths = edit_paths(paths)
  store_paths(paths)
rescue NoChanges
  puts "No changes was made. Cancelling."
rescue InvalidPaths
  puts "Invalid Paths in result, opening editor again."
  retry
end
