#!/usr/bin/env ruby
require 'pp'
re = Regexp.new(ARGV.shift)
ARGV.each do |glob|
  Dir.glob(glob) do |path|
    IO.read(path).scan(re) do |match|
      if match.include?("\n")
        puts "#{path}:"
        puts match
      else
        puts "#{path}: #{match}"
      end
    end
  end
end
