#!/usr/bin/env ruby
#
# Convert Word documents to .pdf/.rtf
#
#   convertdoc.rb input.docx output.pdf
#   convertdoc.rb input.docx output.rtf
#

require 'win32ole'
require 'trollop'

opts = Trollop.options do
  version "reldoc 1.0"
  opt :stamp, "Add version to output filename (before extension)", :default => "_", :type => :string
  opt :verbose, "Verbose output", :default => true

  opt :visible, "Make Word visible during the conversion", :default => false
  opt :formats, "List available formats and exit", :default => false
end

Formats = {
  "Microsoft Word" => { ".rtf" => 6, ".pdf" => 17 },
  "Microsoft Excel" => { ".pdf" => 0 }
}

def getversion(doc)
  # New templates
  doc.BuiltinDocumentProperties.each do |prop|
    if prop.Name == "Content status"
      return prop.Value
    end
  end
  # Old templates
  doc.CustomDocumentProperties.each do |prop|
    if prop.Name == "Content status"
      return prop.Value
    end
  end
  return nil
end

class WordConst; end

if opts.formats
  word = WIN32OLE.new("Word.Application")
  WIN32OLE.const_load(word, WordConst)
  puts WordConst.constants.grep(/^WdFormat/).map{|c|"#{c} #{WordConst.const_get(c)}"}
  word.Quit
  exit
end

Trollop.die "Need one or two file arguments" if ARGV.size < 1 or ARGV.size > 2

inputfile = File.expand_path(ARGV[0])
if ARGV[1]
  if File.directory?(ARGV[1])
    outputfile = File.join(File.expand_path(ARGV[1]), File.basename(inputfile).sub(/\.[^.]+$/, ".pdf"))
  else
    outputfile = File.expand_path(ARGV[1])
  end
else
  outputfile = inputfile.sub(/\.[^.]+$/, ".pdf")
end

outputfile.tr!('/','\\')

outputext = File.extname(outputfile)

# word = WIN32OLE.new("Word.Application")
# word.Visible = !!opts.visible
# begin
#   puts "Opening #{inputfile}" if opts.verbose
#   document = word.Documents.Open(inputfile)
#   begin
#     outputfile.gsub!(/\.[^.]+$/) {
#       (opts.stamp.is_a?(String) ? opts.stamp : "_") +
#       getversion(document).strip + $&
#     } if opts.stamp
#     puts "Saving #{outputfile}" if opts.verbose
#     document.SaveAs(outputfile, outputformat)
#   ensure
#     puts "Closing document" if opts.verbose
#     document.Close(false)
#   end
# ensure
#   puts "Closing Word Application" if opts.verbose
#   word.Quit
# end

class W; end

document = WIN32OLE.connect(inputfile)
if opts.visible
  document.Application.visible = true
end
begin
  outputfile.gsub!(/\.[^.]+$/) {
    if version = getversion(document)
      "_#{version}#{$&}"
    else
      $&
    end
  } if opts.stamp

  app_name = document.Application.Name
  outputformat = Formats[app_name][outputext]
  if outputformat.nil?
    puts "#{outputext} is not a currently supported format"
    puts "Try -f and add the format spec to the source code"
    exit 1
  end
  puts "Saving #{outputfile}" if opts.verbose
  if app_name == "Microsoft Excel"
    document.ActiveSheet.ExportAsFixedFormat(outputformat, outputfile)
  else
    document.SaveAs(outputfile, outputformat)
  end
ensure
  puts "Closing document" if opts.verbose
  document.Close(false)
end
