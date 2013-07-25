#!/usr/bin/env ruby
#
# == Synopsis
#
#   snap             - take a snapshot of current directory
#   snap log         - show log of snapshots
#   snap history     - show history of directory state
#   snap restore <x> - restore snapshot
#
# == Description
#
# Directory snapshot utility. Backs up contents of a hierarchy of
# files and easily restore to any previously stored version.
#
# == Internals
#
# Everything is stored in a content adressable GDBM database using
# SHA1 digests as keys. Values are either binary blobs (files) or
# marshalled Ruby objects. All values are compressed using Zlib.
#
# tree - An array of files and subtrees. Each element contains a
# sub-array with four elements: The type (:blob or :tree), the name,
# the digest of the object, and the file mode.
#
# commit - Hash with the digest of the tree object (:tree), digest of
# the parent commit for this directory (:parent) and the timestamp of
# the commit (:time).
#
# state - Hash with the digest of the commit (:commit), digest of the
# previous state (:previous) and the timestamp (:time).

require 'digest/sha1'
require 'gdbm'
require 'zlib'

def readb(path); File.open(path, "rb") { |f| f.read }; end
def writeb(path, content); File.open(path, "wb") { |f| f.write(content) }; end
def parse_digest(digest); [digest].pack("H*"); end
def format_digest(digest); digest && digest.unpack("H*").first; end

# Recursively finds every file in a directory and below. Yields to the
# passed block for each file.
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

# Wrapper for key-value databases that compresses values.
class CompressedDB
  def initialize(db); @db = db; end
  def [](key); value = @db[key]; return value && Zlib::Inflate.inflate(value); end
  def []=(key, value); @db[key] = Zlib::Deflate.deflate(value); end
  def has_key?(key); @db.has_key?(key); end
  def close; @db.close; end
end

# Save an object and return the digest
def save(obj)
  dump = @dumper.dump(obj)
  digest = @digest.digest(dump)
  @db[digest] = dump
  return digest
end

# Load an object given its digest
def load(digest)
  (dump = @db[digest]) && @dumper.load(dump)
end

# Save a file as a blob and return its digest
def blob(path)
  blob = readb(path)
  digest = @digest.digest(blob)
  @db[digest] = blob unless @db.has_key?(digest)
  return digest
end

# Save a tree and return the digest
def tree(path)
  list = []
  Dir.foreach(path) do |entry|
    next if entry == "." or entry == ".."
    full_path = File.join(path, entry)
    stat = File.stat(full_path)
    if File.directory?(full_path)
      list << [:tree, entry, tree(full_path), stat.mode]
    elsif File.file?(full_path)
      list << [:blob, entry, blob(full_path), stat.mode]
    end
  end
  return save(list)
end

# Save a commit and return the digest of the commit (if unchanged, the
# previous commit digest is returned).
def commit(path = File.expand_path("."))
  tree_digest = tree(path)
  path_digest = @digest.digest(path)
  state = {}
  if state_digest = @db[Dir.pwd]
    state = load(state_digest)
    commit = load(state[:commit])
    return state[:commit] if tree_digest == commit[:tree]
  end
  commit = save(tree: tree_digest, time: Time.now, parent: state[:commit])
  state = save(commit: commit, time: Time.now, previous: state_digest)
  @db[Dir.pwd] = state
  return commit
end

# Check out a commit given a digest
def checkout(commit_digest, path = File.expand_path("."))
  commit = load(commit_digest)
  checkout_tree(commit[:tree], path)
  @db[Dir.pwd] = save(commit: commit_digest, time: Time.now, previous: @db[Dir.pwd])
end

# Load a file from a blob
def checkout_blob(path, digest)
  writeb(path, @db[digest])
end

# Check out a tree of files and subtrees
def checkout_tree(digest, path)
  tree = load(digest)
  Dir.mkdir(path) unless File.directory?(path)
  tree.each do |type, entry, digest, mode|
    full_path = File.join(path, entry)
    case type
    when :tree
      checkout_tree(full_path, digest)
    when :blob
      checkout_blob(full_path, digest)
    end
    File.chmod(mode, full_path)
  end
end

# Resolve a digest from a textual reference
def resolve_reference(reference)
  return reference if @db.has_key?(reference)
  digest = parse_digest(reference)
  return digest if @db.has_key?(digest)
end

# Present the log of commits
def log
  commit_digest = resolve_reference(ARGV.shift || commit)
  until commit_digest.nil?
    commit = load(commit_digest)
    print "#{format_digest commit_digest} #{commit[:time]}"
    print ", parent #{format_digest commit[:parent]}" if commit[:parent]
    puts
    commit_digest = commit[:parent]
  end
end

# Present the directory state history
def history
  state_digest = @db[Dir.pwd]
  until state_digest.nil?
    state = load(state_digest)
    puts "#{format_digest state[:commit]} #{state[:time]}"
    state_digest = state[:previous]
  end
end

# Restore a previous directory state
def restore
  commit_digest = commit
  checkout(resolve_reference(ARGV.shift || commit_digest))
end

# Process command line commands
def process_commands
  if ARGV.empty?
    commit
  else
    commands = %w{ log history restore }
    while arg = ARGV.shift
      if commands.include?(arg)
        self.send(arg)
      else
        fail "Unknown command #{arg}"
      end
    end
  end
end

database_path = File.expand_path("~/.snap")
@digest = Digest::SHA1
@dumper = Marshal
@gdbm = GDBM.new(database_path)
@db = CompressedDB.new(@gdbm)
begin
  process_commands
ensure
  @db.close
end
