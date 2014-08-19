#!/usr/bin/env ruby
ARGV << "**/*.rb" if ARGV.empty?
ARGV.each do |gl|
  gl = File.join(gl, "**/*.rb") if File.directory?(gl)
  Dir.glob(gl) do |path|
    system("ruby", "-c", path) or exit
  end
end.flatten
