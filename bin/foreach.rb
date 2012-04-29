#!/usr/bin/env ruby
require 'digest/sha1'

reset = ARGV.delete('-r')
skip = ARGV.delete('-s')
dontstop = ARGV.delete('-c')
pathspec = ARGV.shift

raise "Missing argument" if pathspec.nil?

procfile = File.join(ENV["TEMP"], Digest::SHA1.hexdigest(Marshal.dump(ARGV)) + ".processed")

@num = 0

def thread_id
  Thread.current["id"] ||= Thread.exclusive { @num += 1 }
end

def log(msg)
  id = thread_id
  Thread.exclusive { puts "#{id}> #{msg}" }
end

def process(job)
  # log job
  File.popen(job, "r") do |io|
    while st = io.gets
      log st unless st.strip.empty?
    end
  end
  $?
end

thread_count = 8

require 'thread'
inqueue = Queue.new
outqueue = Queue.new
threads = []
thread_count.times {
  threads << Thread.new {
    while job = inqueue.pop
      begin
        id, command = job
        result = process(command)
        outqueue.push([id, result])
      rescue Exception => e
        outqueue.push([id, e])
      end
    end
  }
}

processed = reset ? [] : (IO.read(procfile) rescue "").split("\n")

files = Dir[pathspec]
raise "No files found" if files.empty?
nresp = 0
files.each do |fn|
  next if processed.include?(fn)

  command = (ARGV+[fn]).join(" ")
  inqueue.push([fn, command])
  nresp += 1

  if inqueue.size >= thread_count
    fn1, result = outqueue.pop
    nresp -= 1
    success = (result.exitstatus == 0)
    if success
      processed.push(fn1)
      File.open(procfile, "w") { |f| f.puts(*processed) }
    else
      break
    end
  end
end

threads.each { inqueue.push(nil) }
threads.each { |t| t.join }
while nresp > 0
  r = outqueue.pop
  nresp -= 1
  fn1, result = r
  success = (result.exitstatus == 0)
  if success
    processed.push(fn1)
    File.open(procfile, "w") { |f| f.puts(*processed) }
  end
end
