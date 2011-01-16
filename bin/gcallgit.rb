root = ENV["GIT"]
Dir.entries(root).select { |x| x !~ /^\.+$/ }.each do |ent|
  path = File.join(root, ent)
  system("git", "--git-dir", path, "gc")
end
