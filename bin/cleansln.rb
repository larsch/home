#!/usr/bin/env ruby
Dir["**/*.{sln,ncb,ilk}"].each do |path|
  if File.file?(path)
    case path
    when /\.(ilk|ncb)$/
      puts "rm #{path}"
      File.unlink(path)
    when /\.(sln)$/
      puts "clean #{path}"
      system "devenv", path, "/clean", "debug"
      system "devenv", path, "/clean", "release"
      system "devenv", path, "/clean", "relwithdebinfo"
    end
  end
end
