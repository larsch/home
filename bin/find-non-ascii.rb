ARGV.each do |arg|
  Dir.glob(arg).each do |fn|
    line = 0
    IO.read(fn, encoding: "ASCII").each_line do |ln|
      line += 1
      if ln.bytes.find { |x| x >= 128 }
        print "#{fn}:#{line}: #{ln}"
      end
    end
    #.bytes.to_a.index { |x| x >= 128 }) && raise("#{fn} #{a}") }; nil
  end
end
