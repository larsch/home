#!/usr/bin/env ruby
diff_mode = ARGV.delete("-d")
search_text = Regexp.new(ARGV.shift)
replace_text = ARGV.shift
files = ARGV
files << "**/*" if files.empty?
ARGV.each do |glob|
  Dir.glob(glob) do |path|
    path = File.expand_path(path)
    targetpath = File.join(File.dirname(path), File.basename(path).gsub(search_text, replace_text))
    content = File.read(path)
    newcontent = content.gsub(search_text, replace_text)
    if content != newcontent or targetpath != path
      if diff_mode
        File.popen("diff -u \"#{path}\" -", "w") do |io|
          io.write(newcontent)
        end
      else
        File.open(targetpath, "w") do |file|
          puts targetpath
          file << newcontent
          File.unlink(path) if targetpath != path
        end
      end
    end
  end
end
