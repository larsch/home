#!/usr/bin/env ruby
require 'digest/sha1'

reset = ARGV.delete('-f')
skip = ARGV.delete('-s')
dontstop = ARGV.delete('-c')
pathspec = ARGV.shift

raise "Missing argument" if pathspec.nil?

procfile = File.join(ENV["TEMP"], Digest::SHA1.hexdigest(Marshal.dump(ARGV)) + ".processed")

processed = (IO.read(procfile) rescue "").split("\n")
files = Dir[pathspec]
raise "No files found" if files.empty?
files.each do |fn|
  next if processed.include?(fn)
  puts fn
  result = system(*ARGV, fn)
  raise "Failed to run #{ARGV.join(' ')}" if result.nil?
  success = ($?.exitstatus == 0)
  if success
    processed.push(fn)
    File.open(procfile, "w") { |f| f.puts(*processed) }
  elsif not skip and not dontstop
    break
  end
  skip = false
end
