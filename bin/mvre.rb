#!/usr/bin/env ruby
dry_run = ARGV.delete('-n')
force = ARGV.delete('-f')
match = Regexp.new(ARGV.shift)
replace = ARGV.shift
replace = replace.gsub("\\", "\\\\\\\\")
Dir.foreach(".") do |source|
  next if source == "." || source == ".."
  destination = source.gsub(match, replace)
  if destination != source
    if destination.downcase != source.downcase && File.exist?(destination) && !force
      puts "Not renaming #{source} to #{destination} which already exists"
    else
      puts "mv #{source} #{destination}"
      File.rename(source, destination)
    end
  end
end
