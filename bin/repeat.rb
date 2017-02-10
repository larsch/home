#!/usr/bin/env ruby
runs = 0
successes = 0
loop do
  res = system(*ARGV)
  raise "failed to run: #{ARGV.join(' ')}" if res.nil?
  runs += 1
  successes += 1 if res
  failures = runs - successes
  puts "#{runs} runs, #{successes} successes, #{failures} failures"
end
