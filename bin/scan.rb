#!/usr/bin/env/ruby
matching = 0
mismatching = 0
ignored = 0
extra = 0

Dir.glob '**/*.h' do |path|
  content = IO.read(path)
  classes = content.scan(/^(?:class|struct)\s+(\w+)\s+(?::|$)/).flatten
  expected = File.basename(path).sub(/\.h$/, '')
  if classes.size == 1
    classname = classes.first
    if classname == expected
      matching += 1
    else
      puts "#{path}: #{classname} (#{expected})"
      mismatching += 1
    end
  elsif classes.include?(expected)
    puts "#{path} extras: #{classes.join(', ')}"
    extra += 1
  else
    ignored += 1
  end
end

puts "#{matching} matching, #{mismatching} mismatching, #{ignored} ignored, #{extra} extra"
