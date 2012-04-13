#!/usr/bin/env ruby
search_text = ARGV.shift
replace_text = ARGV.shift
files = ARGV
ARGV.each do |glob|
  Dir[glob].each do |path|
    path = File.expand_path(path)
    targetpath = File.join(File.dirname(path), File.basename(path).gsub(search_text, replace_text))
    content = File.read(path)
    newcontent = content.gsub(search_text, replace_text)
    if content != newcontent or targetpath != path
      File.open(targetpath, "w") do |file|
        puts targetpath
        file << newcontent
        File.unlink(path) if targetpath != path
      end
    end
  end
end
