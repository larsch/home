#!/usr/bin/env ruby
files = "**/*.{cpp,h}"
longest = ""
Dir.glob(files) do |path|
  content = IO.read(path)
  content.scan(/[a-z]+/i) do |word|
    if word.size > longest.size
      longest = word
      puts longest
    end
  end
end
