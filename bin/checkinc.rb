#!/usr/bin/env ruby
files = Dir["**/*.{c,cpp,h}"]
files.each do |fn|
  File.open(fn, "r") do |f|
    unless f.grep(/\b(?:memset|strpy|strlen)/).empty?
      if f.grep(/#\s*include\s+<string.h>/).empty?
        puts fn
      end
    end
  end
end
