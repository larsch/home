#!/usr/bin/env ruby
require File.join(File.dirname($0), "edited")
files = []
each_edited_file do |file|
  files << file if file =~ /\.(h|cpp|c)$/
end
system "cmd", "/c", "ruby", "-S", "restyle.rb", "-v", *files
