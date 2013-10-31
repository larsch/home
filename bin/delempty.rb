require 'find'
def recurse_dirs(path = Dir.pwd)
  Dir.foreach(path) do |entry|
    next if entry == '.' || entry == '..'
    subpath = File.join(path, entry)
    recurse_dirs(subpath) if File.directory?(subpath)
  end
  if Dir.entries(path).size == 2
    puts "rmdir #{path}"
    Dir.rmdir(path)
  end
end
recurse_dirs
