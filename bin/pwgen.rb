#!/usr/bin/env ruby
require 'optparse'
require 'securerandom'

@include_control = false
@include_digits = false
@include_uppercase = true
@include_all = false
@length = 24
@count = 1

@letters = (?a..?z).to_a.join
@upletters = (?A..?Z).to_a.join
@digits = (?0..?9).to_a.join
@control = "!/?_$%&*+-,.;:"

OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename $0} [options]"
  opts.on("--length=NUM", "-l", Integer, "Length (default #{@length})") { |v| @length = v }
  opts.on("--[no-]control", "Include control characters (#{@control})") { |v| @include_control = v }
  opts.on("--[no-]digits", "Include digits (0-9)") { |v| @include_digits = v }
  opts.on("--[no-]capital", "Include upper case letters (A-Z)") { |v| @include_uppercase = v }
  opts.on("--all", "-a", "Include all letter and digits, even l, 1, O, and 0") { |v| @include_all = v }
  opts.on("--count=NUM", "-n", Integer, "Number of passwords to generate (1)") { |v| @count = v }
end.parse!

@letters.delete!(?l) unless @include_all
@upletters.delete!(?O) unless @include_all
@digits.delete!(?0) unless @include_all
@digits.delete!(?1) unless @include_all

@classes = []
@classes << @letters
@classes << @upletters if @include_uppercase
@classes << @digits if @include_digits
@classes << @control if @include_control
@all = @classes.join

def rnd(rng)
  rng[SecureRandom.random_number(rng.size)]
end

@col = 0
@limit = 78
@count.times do
  if @col > 0
    if @col + 2 + @length > @limit
      print "\n"
      @col = 0
    else @col > 0
      print " "
      @col += 1
    end
  end
  print (@classes.map { |cls| rnd(cls) } + Array.new(@length - @classes.size) { rnd(@all) }).shuffle.join
  @col += @length
end
puts
