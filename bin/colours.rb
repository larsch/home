#!/usr/bin/env ruby
fgs = [""] + (30..37).map(&:to_s)
bgs = [""] + (40..47).map(&:to_s)
print "    "
bgs.each do |bg|
  printf "%7sm", bg
end
puts
fgs.each do |fg|
  ["","1;"].each do |pref|
    colstr = "#{pref}#{fg}m"
    printf "%6s", colstr
    bgs.each do |bg|
      printf " \e[#{colstr}"
      printf "\e[#{bg}m" unless bg.empty?
      print "  gYw  \e[0m"
    end
    puts
  end
end
