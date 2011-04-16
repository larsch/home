#!/usr/bin/env ruby
module CppRegexp
  CPP_COMMENT = /\/\/.*/
  C_COMMENT = /\/\*.*?\*\//
  COMMENT = /#{CPP_COMMENT}|#{C_COMMENT}/ #/
  STRING_CHAR = /[^\\"]|(?:\\.)/
  STRING = /\"#{STRING_CHAR}*\"/ #/
  OPERATOR = /&&?|\|\|?|\^|[!%\/*+-?:.\[\]{}<>()~]/
  PREPROCESSOR = /\#(\w+).*$/
  WHITESPACE = /[\n\t ]+/
  CPP = %r{
     (?<string>#{STRING}) |
     (?<comment>#{COMMENT}) |
     (?<operator>#{OPERATOR}) |
     (?<whitespace>#{WHITESPACE}) |
     (?<preprocessor>#{PREPROCESSOR}) |
     (?<identifier>[A-Za-z_][A-Za-z0-9]*) |
     (?<char>\'[^\']+\')
  }x
end

ARGV.each do |filename|
  content = File.read(filename)
  reg = /\A(#{CppRegexp::CPP})/
    while x = content.match(reg)
      if ws = x[:whitespace]
        if ws =~ /\A {2,}/
          p [x.pre_match[-10..-1],
            ws,
           x.post_match[0..10]]
        end
      end
      content = x.post_match
      break if content.empty?
    end
  p content[0..80]
end
