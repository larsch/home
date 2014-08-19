#!/usr/bin/env ruby
chars = ("a".."z").to_a.join + ("A".."Z").to_a.join + "0..9" + "!/?_$%&*+-,.;:"
puts Array.new(10) { chars[rand(chars.length)] }.join
