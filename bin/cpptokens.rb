#!/usr/bin/env ruby
require 'pp'

module CppRegexp
  CPP_COMMENT = /\/\/.*/
  C_COMMENT = /\/\*.*?\*\//m
  COMMENT = /#{CPP_COMMENT}|#{C_COMMENT}/ #/
  STRING_CHAR = /[^\\"]|(?:\\.)/m
  STRING = /\"#{STRING_CHAR}*\"/m #/
  INTEGER = /[+-]?(?:[1-9][0-9]*|0[0-7]*|0x[0-9A-F]*)[ul]?/i
  FLOAT = /[+-]?[0-9]*\.[0-9]+(?:e-?\d+)?[ef]?/
  # OPERATOR = /&&?|\|\|?|::|\^|<<?|>>?|->?|&=?|\|=|^=?[!%\/*+?:.\[\]{}()~]/


  # :: ++ -- ( ) . -> - ! ~ * & .* ->* * / % + - << >> < <= > >= == != & ^  | && || ? : = += -= *= /= %= <<= >>= &= ^= |= ,
  # :: ++ -- ( ) . -> - ! ~ * & .* ->* * / % + - << >> < <= > >= == != & ^  | && || ? : = += -= *= /= %= <<= >>= &= ^= |= ,

  # ! != % %= & && &= ( ) * *= + ++ += , - -- -= -> ->* . .* / /= : :: < << <<= <= = == > >= >> >>= ? ^ ^= | |= || ~
  OPS = %w{ ! != % %= & && &= ( ) * *= + ++ += , - -- -= -> ->* . .* / /= : :: < << <<= <= = == > >= >> >>= ? ^ ^= | |= || ~ }

  OPERATOR = /!=?|%=?|&[&=]?|[(),~;{}\[\]]|\*=?|\+[+=]?|-(?:-|=|>\*?)?|\.\*?|\/=?|::?|<(?:<=?|<|=)?|==?|>(?:=|>|>=)?|\?|\^=?|\|[=\|]?/
  # OPS2 = /\A#{OPERATOR}/
  # OPS.each do |op|
  #   p [op, op =~ OPS2]
  # end
  # p OPERATOR

  PREPROCESSOR = /\#(?:\w+).*$/
  WHITESPACE = /[\n\t ]+|(?:\\$)/
  IDENTIFIER = /[A-Za-z_][A-Za-z0-9_]*/
  CHARLITERAL = /\'[^\']+\'/
  CPP_NAMED = %r{
     (?<string>#{STRING}) |
     (?<comment>#{COMMENT}) |
     (?<operator>#{OPERATOR}) |
     (?<whitespace>#{WHITESPACE}) |
     (?<preprocessor>#{PREPROCESSOR}) |
     (?<identifier>#{IDENTIFIER}) |
     (?<char>#{CHARLITERAL}) |
     (?<float>#{FLOAT}) |
     (?<integer>#{INTEGER})
  }x

  CPP2 = %r{
     \A
     (?:#{STRING}) |
     (?:#{COMMENT}) |
     (?:>#{OPERATOR}) |
     (?:#{WHITESPACE}) |
     (?:#{PREPROCESSOR}) |
     (?:#{IDENTIFIER}) |
     (?:#{CHARLITERAL})
  }x

  OREGP = [
    [ :string, /\A#{STRING}/ ],
    [ :comment, /\A#{COMMENT}/ ],
    [ :operator, /\A#{OPERATOR}/ ],
    [ :whitespace, /\A#{WHITESPACE}/ ],
    [ :preprocessor, /\A#{PREPROCESSOR}/ ],
    [ :identifier, /\A#{IDENTIFIER}/ ],
    [ :char, /\A#{CHARLITERAL}/ ],
    [ :float, /\A#{FLOAT}/ ],
    [ :integer, /\A#{INTEGER}/ ],
  ]
end

def tokenize_named(content)
  result = []
  start_at = 0
  while m = content.match(CppRegexp::CPP_NAMED, start_at)
    break if m.offset(0)[0] != start_at
    clss = m.names.find { |nm| m[nm] }.to_sym
    result << [m.to_s, clss, *m.offset(0)]
    start_at = m.end(0)
  end
  raise "Unparseable at #{content[start_at, 30].inspect}"  if start_at < content.size
  return result
end

def each_token(content, &block)
  result = []
  until content.empty?
    found = false
    CppRegexp::OREGP.each do |type, re|
      if x = content.match(re)
        result.push([type, $&])
        content = x.post_match
        found = true
      end
    end
    raise content[0..50] unless found
  end
  return result
end

def tokenize(content)
  content.scan(CppRegexp::CPP2) do |match|
    # p match.begin(0)
    p match[:identifier]
    yield(match)
  end
  # while x = content.match(CppRegexp::CPP2)
  #   yield(x)
  #   content = x.post_match
  #   break if content.empty?
  # end
end

def h(text)
  text.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;')
end

def to_html(content)
  puts "<html>"
  puts "<head>"
  puts "<style>"
  puts ".comment { color: gray; }"
  puts ".integer,.char,.float,.string { color: red; }"
  puts ".identifier { color: blue; }"
  puts "</style>"
  puts "</head>"
  puts "<body><pre>"

  start_at = 0
  while m = content.match(CppRegexp::CPP, start_at)
    # STDERR.puts [start_at, m.end(0), m.to_s, m.post_match, content[m.end(0), 3]].inspect
    break if m.offset(0)[0] != start_at
    color = "#%06x" % rand(2**24)
    clss = m.names.select { |nm| m[nm] }.join(" ")
    print "<span class=\"#{clss}\">#{h(m.to_s)}</span>"
    # p [m.begin(0), m.end(0), m]
    start_at = m.end(0)
  end

  if start_at < content.size
    raise "Unparseable at #{content[start_at, 30].inspect}"
  end

  puts "</pre></body></html>"

  # puts each_token(content).reject { |x,y| x == :whitespace }.map { |x,y| y }
end

def count_equal(a, b)
  equal = 0
  begin
  until equal == a.size || equal == b.size
    if a[equal].first == b[equal].first
      equal += 1
    else
      break
    end
  end
  rescue NoMethodError => e
      pp a[0,10]
  pp b[0,10]
    raise
  end
  return equal
end

def map_chars(a)
  a.map { |a| a.map { |b| b[0] } }
end

def ppp(a)
  pp(map_chars(a))
end

THRESHOLD = 50

class FilePosition
  attr_accessor :file, :pos
  def initialize(file, pos)
    @file = file
    @pos = pos
  end
  def range_to(filepos)
    FileRange.new(@file, @pos, filepos.pos - @pos)
  end
end

class FileRange < FilePosition
  attr_accessor :length
  def initialize(file, pos, length)
    @length = length
    super(file, pos)
  end
  def behind
    @pos + @length
  end
  def inspect
    "<#{@file}:#{@pos}+#{@length}>"
  end
  def <=>(other)
    0
  end
  def include?(range)
    range.pos >= @pos && range.behind <= behind
  end
end

all_tokens = []
sub_strings = []
ARGV.each do |glob|
  Dir.glob(glob) do |filename|
    puts filename
    content = File.read(filename)
    tokens = tokenize_named(content).reject { |m,type,a,b| type == :whitespace || type == :comment }
    tokens.map! { |token, type, start, behind| [token, FileRange.new(filename, start, behind-start)]}
    # Generate all sub-strings
    size = tokens.size
    tokens.size.times { |i| sub_strings.push(tokens.drop(i)) }
  end
end
puts "#{sub_strings.size}"

# sub_strings.each do |subtr|
#   subtr.each do |a, b|
#     raise "hell" unless a.is_a?(String)
#     raise "hell" unless b.is_a?(FileRange)
#   end
# end

# pp tokens.size
# size = tokens.size
# pp GC.stat

# pp sub_strings.map { |a| a.map { |b| b[0] } }
puts "Sorting substrings"
sub_strings.sort!

# Find common substrings longer than threshold
common_substrings = []
sub_strings.each_cons(2) do |a, b|
  eq = count_equal(a, b)
  if eq > THRESHOLD
    common_substrings << [
      a.first[1].range_to(a[eq-1][1]),
      b.first[1].range_to(b[eq-1][1]) ]
    # common_substrings << [start, behind, b.first[2], b[eq-1][3]]
  end
end
common_substrings.sort_by! { |suba, subb| -suba.length }

unique_common_substrings = []
until common_substrings.empty?
  first = common_substrings.shift
  unique_common_substrings.push(first)
  common_substrings.delete_if { |suba, subb| suba.include?(first[0]) }
end
unique_common_substrings.each do |suba, subb|
  puts suba.inspect
  puts subb.inspect
  puts IO.read(suba.file)[suba.pos, suba.length]
end
# pp sub_strings.map { |a| a.map { |b| b[0] } }
