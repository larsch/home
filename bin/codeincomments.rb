#!/usr/bin/ruby

# Detect source code in comments.

files = Dir["**/*.{cpp,c,h}"]

# iscode - determines whether a string looks like code in a comment.

def iscode(c)
  iscode = false

  # doxygen is never code
  return false if c =~ /^\/(\*\*|\/\/|\*!)/
  return false if c =~ /^\/\/\//

  # lint directive is never code
  return false if c =~ /^\/\/lint\b/

  # BPS text-debug is not code
  return false if c =~ /BPS_TEXT_DEBUG/

  c.split(/\n/).each { |ln|
    # semi-colon at end of line indicates code
    iscode = true if ln =~ /;\s*$/
    # use of brances indicates code
    iscode = true if ln =~ /(^|[^@])[{}]/
    # single words with a comma indicates enum commands
    iscode = true if ln =~ /^\s*\w+\s*(=\s*\d+\s*),\s*((\/\/|\/*)?.*)$/
    # preprocessor directives
    iscode = true if ln =~ /\#\s*(include|if|ifdef|endif|define)/
    #
    iscode = true if ln =~ /\w\(.*\),/
    #
  }
  return iscode
end

commentcount = 0
linescount = 0

files.each { |fn|
  File.open(fn, "r") { |f|

    # Scan the file for comments (multiple lines of comments are
    # treated as one).
    f.read.scan(/(\/\*(.*?)\*\/)|((\/\/.*?\n)+)/m) { |c|

      # Get the number of lines in the comment
      lineno = $`.split(/\n/).length + 1

      # Print the lines if it looks like code
      if iscode(c[1]||c[2])
	puts "#{File.expand_path(fn)}(#{lineno}) : " + (c[0]||c[2])
	linescount += (c[0]||c[2]).split(/\n/).length
	commentcount += 1
        $stdout.flush
      end
    }

  }
}
puts
puts "#{linescount} lines in #{commentcount} comments."
