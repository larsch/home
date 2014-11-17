#!/usr/bin/env ruby
require 'fileutils'
Dir["**/{.#*,#*#}"].each do |fn|
  puts fn
  FileUtils.rm_rf(fn)
end
