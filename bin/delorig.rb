#!/usr/bin/env ruby
require 'fileutils'
Dir["**/{*.{orig,rej},*.{BACKUP,BASE,REMOTE,LOCAL}.*}"].each do |fn|
  puts fn
  FileUtils.rm_rf(fn)
end
