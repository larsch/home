#!/usr/bin/env ruby
require 'pp'
require 'set'
require 'getoptlong'

module CppRegexp
  CPP_COMMENT = /\/\/.*/
  C_COMMENT = /\/\*.*?\*\//m
  COMMENT = /#{CPP_COMMENT}|#{C_COMMENT}/ #/
  STRING_CHAR = /[^\\"]|(?:\\.)/m
  STRING = /\"#{STRING_CHAR}*\"/m #/
  INTEGER = /[+-]?(?:[1-9][0-9]*|0[0-7]*|0x[0-9A-F]*)[ul]?/i
  FLOAT = /[+-]?[0-9]*\.[0-9]+(?:e-?\d+)?[ef]?/
  OPS = %w{ ! != % %= & && &= ( ) * *= + ++ += , - -- -= -> ->* . .* / /= : :: < << <<= <= = == > >= >> >>= ? ^ ^= | |= || ~ }
  OPERATOR = /!=?|%=?|&[&=]?|[(),~;{}\[\]]|\*=?|\+[+=]?|-(?:-|=|>\*?)?|\.\*?|\/=?|::?|<(?:<=?|<|=)?|==?|>(?:=|>|>=)?|\?|\^=?|\|[=\|]?/
  PREPROCESSOR = /\#\s*(?:\w+).*$/
  WHITESPACE = /[\n\t ]+|(?:\\$)/
  IDENTIFIER = /[A-Za-z_][A-Za-z0-9_]*/
  CHARLITERAL = /\'[^\']+\'/
  SUBSTITUTABLE = /\A(?:#{IDENTIFIER}|#{STRING}|#{INTEGER}|#{FLOAT}|#{CHARLITERAL})\z/
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
  raise "Unparseable at #{content[start_at, 30].inspect}" if start_at < content.size
  return result
end

def count_equal(a, b)
  count = 0
  substitutions = nil
  until count == a.size || count == b.size
    a_token = a[count].token
    b_token = b[count].token
    if a[count].token == b[count].token
      count += 1
    elsif count + 1 < a.size && count + 1 < b.size && a[count+1].token == b[count+1].token && a_token =~ CppRegexp::SUBSTITUTABLE && b_token =~ CppRegexp::SUBSTITUTABLE
      substitutions ||= Set.new
      break if substitutions.size >= @max_substitutions
      substitutions.add [a_token, b_token]
      count += 1
    else
      break
    end
  end
  return count, substitutions
end

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

module Cache
  @contents = {}
  def self.read(filename)
    @contents[filename] ||= IO.read(filename)
  end
end

class FileRange < FilePosition
  attr_accessor :length
  def initialize(file, pos, length)
    @length = length
    super(file, pos)
  end
  def content
    Cache.read(@file)
  end
  def behind
    @pos + @length
  end
  def inspect
    "<#{@file}:#{line}(#{length})>"
  end
  def include?(range)
    range.pos >= @pos && range.behind <= behind
  end
  def line
    @line ||= content[0, @pos].count("\n") + 1
  end
  def location
    "#{File.expand_path file}(#{line})"
  end
  def overlaps?(other)
    @file == other.file &&
      (pos < other.pos && other.pos < behind) ||
      (other.pos < pos && pos < other.behind)
  end
  def lines
    @lines ||= content[@pos, @length].count("\n") + 1
  end
  def <=>(other)
    v = @file <=> other.file
    if v == 0
      @pos <=> other.pos
    else
      v
    end
  end
end

class SpecificToken
  attr_reader :token, :range
  def initialize(token, range)
    @token = token
    @range = range
  end
  def <=>(other)
    token <=> other.token
  end
  def range_to(other)
    range.range_to(other.range)
  end
end

@verbose = false
@min_tokens = 50
@min_lines = 1
@max_substitutions = 1
@max_copy_paste = 50

opts = GetoptLong.new(
  [ '--help', '-h', '-?', GetoptLong::NO_ARGUMENT ],
  [ '--tokens', '-t', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--lines', '-l', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--sub', '-s', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--max', '-m', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--verbose', '-v', GetoptLong::NO_ARGUMENT ])
opts.each do |opt, arg|
  case opt
  when '--help'
    puts "findcopypaste [--options] [path | glob] ..."
    puts

    puts "Paths can be directories names. All source files will be searched."
    puts
    puts "Glob patterns can be ruby-esque Dir.glob patterns, for example:"
    puts
    puts "    *.cpp"
    puts "    src/**/*.cpp"
    puts
    puts "Options:"
    puts
    puts "    --help -h -?     Show this information"
    puts "    --tokens=n|-t n  Find only copy/paste of <n> or more token (default 50)"
    puts "    --lines=n|-l n   Find only copy/paste spanning <n> or more lines (default 1)"
    puts "    --sub=n|-s n     Find only copy/paste with up to <n> identifier & literal substitutions (default 1)"
    puts "    --max=n|-m n     Limit output to biggest <n> copy/paste chunks (default 50)"
    puts "    --verbose|-v     Be verbose"
    exit
  when '--tokens'
    @min_tokens = arg.to_i
    if @min_tokens <= 0
      puts "The minimum number of tokens must be a non-zero positive number"
      exit 1
    end
  when '--lines'
    @min_lines = arg.to_i
    if @min_lines <= 0
      puts "The minimum number of lines must be a non-zero positive number"
      exit 1
    end
  when '--sub'
    @max_substitutions = arg.to_i
    if @max_substitutions <= 0
      puts "The maximum number of substitution must be a non-zero positive number"
      exit 1
    end
  when '--max'
    @max_copy_paste = arg.to_i
    if @max_copy_paste <= 0
      puts "The maximum number of reported copy/paste chunks must be a non-zero positive number"
      exit 1
    end
  when '--verbose'
    @verbose = true
  end
end

DEFAULT_GLOB = "**/*.{cpp,cc,c,cxx,h,hxx,hpp,java,cs}"

# Search the default pattern for directories that are specified on the
# command line.
argv = ARGV.map do |glob|
  if File.directory?(glob)
    File.join(glob, DEFAULT_GLOB)
  else
    glob
  end
end

# By default, search the default pattern in the current directory if
# no path or pattern is specified.
argv.push(DEFAULT_GLOB) if argv.empty?

# Fix up paths (Dir.glob does not work with mixed forward and
# backwards slashes)
argv = argv.map { |arg| arg.tr('\\','/') }

sub_strings = []
Dir.glob(argv) do |filename|
  puts filename if @verbose
  # Read content of file
  content = Cache.read(filename)
  # Find pertinent tokens (non-whitespace, non-comment)
  tokens = tokenize_named(content).reject { |m,type,a,b| type == :whitespace || type == :comment }
  # Translate to tuples of token and references to the file and character range
  tokens.map! { |token, type, start, behind| SpecificToken.new(token, FileRange.new(filename, start, behind-start)) }
  # Generate all sub-strings
  tokens.size.times { |i| sub_strings.push(tokens.drop(i)) }
end
puts "Sorting #{sub_strings.size} substrings" if @verbose
sub_strings.sort!

# Find common substrings longer than threshold
common_substrings = []
sub_strings.each_cons 2 do |a, b|
  length, substitutions = count_equal(a, b)
  if length >= @min_tokens
    # common_pair = [ a.first[1].range_to(a[length-1][1]), b.first[1].range_to(b[length-1][1]) ]
    common_pair = [ a.first.range_to(a[length-1]), b.first.range_to(b[length-1]) ].sort
    common_pair << length
    common_pair << substitutions
    common_substrings << common_pair
  end
end

# Sort by longs common substring
common_substrings.sort_by! { |suba, subb| -suba.length }

# Eliminate partial common substrings
unique_common_substrings = []
until common_substrings.empty?
  first = common_substrings.shift
  unique_common_substrings.push(first)
  common_substrings.delete_if { |suba, subb|
    (first[0].overlaps?(suba) && first[1].overlaps?(subb)) ||
    (first[0].overlaps?(subb) && first[1].overlaps?(suba)) }
end

unique_common_substrings.each do |suba, subb, length, sub|
  break if @max_copy_paste == 0
  if suba.lines >= @min_lines || subb.lines >= @min_lines
    if sub && sub.size > 0
      substitution_message = "#{sub.size} substitution"
      substitution_message << "s" if sub.size > 1
    else
      substitution_message = "exact match"
    end
    puts "#{subb.location}: Duplicate code of #{length} tokens spanning #{subb.lines} lines (#{substitution_message})"
    puts "#{suba.location}: First match (#{suba.lines} lines)"
    if sub
      sub.each do |a, b|
        puts "\tSubstitution: #{a} -> #{b}"
      end
    end
    @max_copy_paste -= 1
  end
end
