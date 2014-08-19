#!/usr/bin/env ruby
diff = ARGV.delete('--diff')
dryrun = ARGV.delete('--dry-run')

Dir.glob("**/{CMakeLists.txt,*.rst,*.rb}") do |path|
  next if path =~ /3rdparty/
  content = IO.read(path)
  orig_content = content.dup
  content.gsub!(/ *$/, '')
  content = content.strip + "\n"
  if content != orig_content
    puts path
    if diff
      File.open("tmp.txt", "w") { |io| io.write content }
      system "diff", path, "tmp.txt"
      File.unlink("tmp.txt")
    elsif dryrun
    else
      File.open(path, "w") { |io| io.write content }
    end
  end
end
