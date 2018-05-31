#!/usr/bin/env ruby
name = ARGV.first
system 'cmake', '--graphviz=graphviz/graphviz', '.'
system 'dot', '-Tpng', '-O', "graphviz/graphviz.#{name}"
system 'start', "graphviz/graphviz.#{name}.png"
