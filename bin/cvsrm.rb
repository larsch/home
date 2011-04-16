#!/usr/bin/env ruby
ARGV.each do |path|
  File.unlink(path)
end
system "cvs", "rm", *ARGV
