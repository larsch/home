#!/usr/bin/env ruby

def align(lines, char = "=")
  count = 0
  spaces = 0
  type = nil
  stubs = []
  lengths = []
  indents = []
  lines.each_with_index do |ln, i|
    if ln =~ /^(.*?\S)(\s{1,})(#{char}.*)/
      lengths.push($1.length)
      indents.push($1.length + $2.length)
      stubs.push([$1, $3])
      spaces += $2.length
      count += 1
    else
      if spaces > count && count > 1 && indents.min != indents.max
        puts "Candidate: #{i},#{count}", *lines[i-count..i]
        p [indents.min, indents.max]
        indent = lengths.max + 1
        count.times do |j|
          lines[i-count+j] = stubs[j][0] + " " * (indent - stubs[j][0].length) + stubs[j][1]
        end
        puts "Result: #{i},#{count}", *lines[i-count..i]
      end
      spaces = 0
      count = 0
      stubs = []
      indents = []
      lengths = []
    end
  end
end

ARGV.each do |fn|
  lines = IO.read(fn).lines.to_a
  align(lines, /_\w+/)
  align(lines, "//")
  align(lines, /=[^=]/)
end
