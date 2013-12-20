#!/usr/bin/env ruby
exts = [""] + ENV["PATHEXT"].split(";")
ENV["PATH"].split(";").each do |path|
  exts.each do |ext|
    filepath = File.expand_path(path + "\\" + ARGV[0] + ext)
    filepath = filepath.tr(File::SEPARATOR, File::ALT_SEPARATOR) if defined?(File::ALT_SEPARATOR)
    puts filepath if File.exist?(filepath)
  end
end
