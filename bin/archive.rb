#!/usr/bin/env ruby
require 'fileutils'
raise "%HOME% not set" unless ENV.has_key?("HOME")
raise "%HOME% not found (#{ENV["HOME"]})" unless File.directory?(ENV["HOME"]) 
ARCHIVE_PATH = File.join(ENV["HOME"], "archive").tr('\\','/')
SZIP = "C:/Program Files/7-zip/7z.exe"

def archive(path)
  raise "#{path} not found" unless File.exist?(path)
  raise "#{SZIP} not found" unless File.exist?(SZIP)
  year = Time.now.strftime("%Y")
  prefix = Time.now.strftime("%m_%d_%H%M_")
  zpath = File.join(ARCHIVE_PATH, year, prefix + File.basename(path) + ".7z")
  raise "#{zpath} already exist" if File.exist?(zpath)
  args = [ SZIP, "a", zpath, path ]
  puts args.join(" ")
  case system(*args)
  when nil
    raise "Failed to run 7-zip"
  when false
    raise "7-zip exited with an error"
  when true
    FileUtils.rm_rf path
    puts "#{path} removed"
  end
end

ARGV.each { |path| archive(path) }
