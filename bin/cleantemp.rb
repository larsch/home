#!/usr/bin/env ruby

# Removes old files in temporary directorys.

def human_size(n)
  return "0 B" if n.zero?
  sizes = %w{B KiB MiB GiB TiB PiB EiB ZiB YiB}
  x = (Math.log(n) / Math.log(1024)).floor
  n = n / (1024.0 ** x)
  n = n.round(2)
  n = n.to_i if n.round == n
  "#{n} #{sizes[x]}"
end

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

def clean(clean_path, max_age = MAX_AGE)
  total_size = 0
  file_count = 0
  dir_count = 0
  files(clean_path) do |path|
    begin
      age = Time.now - File.mtime(path)
      if age > MAX_AGE
        total_size += File.size(path)
        file_count += 1
        File.unlink(path) rescue nil
      end
    rescue Errno::ENOENT
    end
  end
  directories(clean_path) do |path|
    if Dir.entries(path).size == 2
      begin
        Dir.rmdir(path)
        dir_count += 1
      rescue Errno::EACCES
      end
    end
  end
  puts "Removed #{file_count} files (#{human_size total_size}) and #{dir_count} directories from #{clean_path}."
end
clean ENV['TEMP']
clean ENV['USERPROFILE'] + '\Downloads', 31*24*60*60
system "net stop wuauserv"
clean ENV['SystemRoot'] + '\SoftwareDistribution\Download'
clean ENV['SystemRoot'] + '\Temp'
clean ENV['USERPROFILE'] + '\AppData\Local\Microsoft\Windows\Temporary Internet Files'
system "net start wuauserv"
