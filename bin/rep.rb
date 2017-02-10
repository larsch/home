#!/usr/bin/env ruby
if ARGV.delete("-?") || ARGV.delete("--help")
  puts "#{$0} [-d|--diff] search-regexp replace-expr [path-glob[ ...]]"
  puts
  puts "  -d | --diff   Show changes that are going to be made without making them"
  puts
  puts "Examples:"
  puts "  rep myMispeling myCorrectSpelling"
  puts "  rep \"prefix(\\w+)\" \"newPrefix\\1\""
  exit
end
diff_mode = ARGV.delete("-d") || ARGV.delete("--diff")
if argv = ARGV.find { |arg| arg[0] == '-' }
  puts "Unknown option: #{argv}"
  exit
end
if ARGV.size < 2
  puts "Missing arguments. Try --help."
end
search_text = Regexp.new(ARGV.shift)
replace_text = ARGV.shift
files = ARGV
files << "**/*" if files.empty?
ARGV.each do |glob|
  Dir.glob(glob) do |path|
    next unless File.file?(path)
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
        puts targetpath
        IO.write(path, newcontent)
        system "git", "mv", path, targetpath unless targetpath == path
      end
    end
  end
end
