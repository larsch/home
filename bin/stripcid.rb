#!/usr/bin/env ruby
Dir.foreach('.') do |fn|
  if fn =~ /^%7bcid[0-9A-F]{32}%40.*?%7d(.*)$/
    puts "mv #{fn} #{$1}"
    File.rename fn, $1
  end
end
