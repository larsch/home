#!/usr/bin/env ruby
LETTERS = (?a..?z).to_a - [?l]
UPLETTERS = (?A..?Z).to_a - [?O]
DIGITS = (?0..?9).to_a - [?0, ?1]
CONTROL = "!/?_$%&*+-,.;:"
ALL = [LETTERS, UPLETTERS, DIGITS, CONTROL].join
def rnd(rng); rng[rand(rng.size)]; end
LENGTH = 10
puts ([rnd(LETTERS), rnd(UPLETTERS), rnd(DIGITS), rnd(CONTROL)] + Array.new(LENGTH - 4) { rnd(ALL) }).shuffle.join
