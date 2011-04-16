#!/usr/bin/env ruby
require 'time'

def each_dir(path = '.', &block)
  Dir.entries(path).each do |entry|
    next if entry == "." or entry == ".." or entry == "CVS"
    subpath = File.join(path, entry)
    if File.directory?(subpath)
      each_dir(subpath, &block) 
      yield(subpath)
    end
  end
end

def each_cvs_file
  each_dir do |path|
    entriesfile = File.join(path, "CVS", "Entries")
    if File.exist?(entriesfile)
      File.read(entriesfile).lines.map { |x| x.split('/') }.each do |type,name,rev,date|
        if type == ""
          time = nil
          begin
            date[-4,0] ="GMT "
            time = Time.parse(date)
          rescue ArgumentError
            time = Time.utc(1970)
          end
          file = File.join(path, name)
          yield(file, rev, time)
        end
      end
      # exit
    end
  end
end

def each_edited_file
  each_cvs_file do |file,rev,time|
    if File.file?(file)
      if File.mtime(file) != time
        yield file, rev, time
      end
    end
  end
end

if $0 == __FILE__
  each_edited_file do |file,rev,time|
    puts file
  end
end  
