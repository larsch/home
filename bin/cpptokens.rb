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
  CPP = %r{
     \A
     (?<string>#{STRING}) |
     (?<comment>#{COMMENT}) |
     (?<operator>#{OPERATOR}) |
     (?<whitespace>#{WHITESPACE}) |
     (?<preprocessor>#{PREPROCESSOR}) |
     (?<identifier>#{IDENTIFIER}) |
     (?<char>#{CHARLITERAL})
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

def tokenize2(content, &block)
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
  while x = content.match(CppRegexp::CPP2)
    yield(x)
    content = x.post_match
    break if content.empty?
  end
end

ARGV.each do |filename|
  content = File.read(filename)
  puts tokenize2(content).reject { |x,y| x == :whitespace }.map { |x,y| y }
end
