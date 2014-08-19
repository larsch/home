#!/usr/bin/env ruby
file = ARGV[0]
system("doxygen", "-s", "-u", file) or fail("Failed to update #{file}")
system("doxygen", "-s", "-g", "Doxyfile.pristine")
