#!/usr/bin/env ruby
Dir.glob "**/*.{sln,ncb,ilk,ipch,suo,user,ncb,sbr,sdf,dmp}" do |path|
  if File.file?(path)
    case path
    when /\.sln$/
      puts "clean #{path}"
      system "msbuild", "/nologo", path, "/target:Clean", "/p:Configuration=Debug"
      system "msbuild", "/nologo", path, "/target:Clean", "/p:Configuration=Release"
      system "msbuild", "/nologo", path, "/target:Clean", "/p:Configuration=RelWithDebInfo"
    else
      puts "rm #{path}"
      File.unlink(path)
    end
  end
end
