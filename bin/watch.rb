#!/usr/bin/env ruby
interval = 5.0
tnext = Time.now
loop do
  tdelta = tnext - Time.now
  sleep tdelta if tdelta > 0
  puts ARGV.join(" ")
  system(*ARGV)
  tnext += interval
end
