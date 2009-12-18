#!/usr/bin/env ruby

# Removes old files in temporary directorys.

def files(path, &block)
  Dir.entries(path).each do |entry|
    next if entry == "." or entry == ".."
    subpath = File.join(path, entry)
    if File.directory?(subpath)
      files(subpath, &block)
    else
      block.call(subpath)
    end
  end
end

def directories(path, &block)
  Dir.entries(path).each do |entry|
    next if entry == "." or entry == ".."
    subpath = File.join(path, entry)
    if File.directory?(subpath)
      directories(subpath, &block)
      block.call(subpath)
    end
  end
end


# 2 days
MAX_AGE = 2*24*60*60

total_size = 0
file_count = 0
dir_count = 0

files(ENV['TEMP']) do |path|
  age = Time.now - File.mtime(path)
  if age > MAX_AGE
    total_size += File.size(path)
    file_count += 1
    File.unlink(path)
  end
end

directories(ENV['TEMP']) do |path|
  if Dir.entries(path).size == 2
    begin
      Dir.rmdir(path)
      dir_count += 1
    rescue Errno::EACCES
    end
  end
end

puts "Removed #{file_count} files (#{total_size} bytes) and #{dir_count} directories."
