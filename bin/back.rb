#!/usr/bin/env ruby
require 'gdbm'
require 'digest/sha1'
require 'pathname'
require 'thread'
require 'zlib'

def each_file(path = nil, &block)
  Dir.foreach(path || '.') do |entry|
    next if entry == "." or entry == ".."
    subpath = (path && File.join(path, entry)) || entry
    if File.directory?(subpath)
      each_file(subpath, &block)
    else
      block.call(subpath)
    end
  end
end

def readb(path)
  File.open(path, "rb") do |f|
    f.read
  end
end

class CompressedDB
  def initialize(db)
    @db = db
    @dictionary = readb("cm/acc/adapl/regm/regmf.cpp")
  end
  def [](key)
    value = @db[key]
    return value && Zlib::Inflate.inflate(value)
  end
  def []=(key, value)
    deflate = Zlib::Deflate.new
    #deflate.set_dictionary(@dictionary)
    @db[key] = deflate.deflate(value, Zlib::FULL_FLUSH)
    fl = deflate.flush
    deflate.close
  end
  def has_key?(key)
    @db.has_key?(key)
  end
  def close
    @db.close
  end
end

@gdbm = GDBM.new(File.expand_path("~/back.db"))
@db = CompressedDB.new(@gdbm)

def store_tree
  list = []
  each_file do |path|
    digest = Digest::SHA1.file(path).digest
    @db[digest] = readb(path) unless @db.has_key?(digest)
    list << [path, digest]
  end
  tree = {
    list: list,
    time: Time.now,
    parent: @db[Dir.pwd]
  }
  treem = Marshal.dump(tree)
  treedigest = Digest::SHA1.digest(treem)
  @db[treedigest] = treem
  @db[Dir.pwd] = treedigest
  return treedigest, tree
end

def load_tree(tag)
  treem = @db[tag]
  raise "\"#{tag}\" not found" if treem.nil?
  return Marshal.load(m)
end

def tree_delta(tree1, tree2)
  tree1 = tree1.sort_by { |p,d| p }
  tree2 = tree2.sort_by! { |p,d| p }
  while tree1.first && tree2.first
    case tree1.first.first <=> tree2.first.first
    when -1
      yield "+", tree1.first
      tree1.shift
    when 0
      if tree1.first.last != tree2.first.last
        yield "M", tree1.first, tree2.first
      end
      tree1.shift
      tree2.shift
    when 1
      yield "-", tree2.first
      tree2.shift
    end
  end
  tree1.each { |e| yield "+", e }
  tree2.each { |e| yield "-", e }
end

digest, tree = store_tree
while arg = ARGV.shift
  case arg
  when 'tag'
    tag = ARGV.shift
    @db[tag] = digest
  when 'status'
    tag = ARGV.shift
    digest = @db[tag]
    raise "\"#{tag}\" not found" if digest.nil?
    otree = load_tree(digest)
    tree_delta(tree[:list], otree[:list]) do |a, e1, e2|
      puts "#{a} #{e1.first}"
    end
  when 'restore'
    tag = ARGV.shift
    otree = load_tree(@db[tag])
  else
    puts "Unknown command '#{arg}'"
  end
  
end

@db.close

