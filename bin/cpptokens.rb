#!/usr/bin/env ruby
module CppRegexp
  CPP_COMMENT = /\/\/.*/
  C_COMMENT = /\/\*.*?\*\//m
  COMMENT = /#{CPP_COMMENT}|#{C_COMMENT}/ #/
  STRING_CHAR = /[^\\"]|(?:\\.)/m
  STRING = /\"#{STRING_CHAR}*\"/m #/
  OPERATOR = /&&?|\|\|?|\^|[!%\/*+-?:.\[\]{}<>()~]/
  PREPROCESSOR = /\#(?:\w+).*$/
  WHITESPACE = /[\n\t ]+|(?:\\$)/
  IDENTIFIER = /[A-Za-z_][A-Za-z0-9]*/
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
  ]
end

def tokenize2(content)
  until content.empty?
    found = false
    CppRegexp::OREGP.each do |type, re|
      if x = content.match(re)
        yield(type, $&)
        content = x.post_match
        found = true
        break
      end
    end
    raise content[0..50] unless found
  end
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
  tokenize2(content) { |*x| }
end
