#!/usr/bin/env ruby
diff = ARGV.delete('--diff')
dryrun = ARGV.delete('--dry-run')

path = ARGV[0] || "**/*.{txt,rst,c,cpp,h,rb,bat,cmd,cs,resx,gitignore}"
Dir.glob(path, File::FNM_DOTMATCH) do |path|
  next unless File.file?(path)
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
