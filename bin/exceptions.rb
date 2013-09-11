#!/usr/bin/env ruby
@hierarchy = {}
root = nil
ObjectSpace.each_object(Class) do |cls|
  if cls.superclass
    (@hierarchy[cls.superclass.name] ||= []) << cls.name
  else
    root = cls.name
  end
end

def print_tree(name, indent = "", folindent = "")
  puts "#{indent}#{name}"
  if subclasses = @hierarchy[name]
    subclasses.each_with_index do |cls, i|
      if i == subclasses.size - 1
        print_tree(cls, folindent + "\\-", folindent + "  ")
      else
        print_tree(cls, folindent + "|-", folindent + "| ")
      end
    end
  end
end
print_tree(root)
