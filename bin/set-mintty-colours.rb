#!/usr/bin/env ruby
mintty_rc_path = File.expand_path("~/.minttyrc")
if File.exist?(mintty_rc_path)
  mintty_settings = Hash[File.read(mintty_rc_path).each_line.map { |ln| ln.chomp.split('=') }]
else
  mintty_settings = {}
end
settings = Hash[STDIN.each_line.map { |ln| ln.chomp.split('=') }]
color_map = {
  'Black' => 'Black',
  'Blue' => 'Blue',
  'Green' => 'Green',
  'Cyan' => 'Cyan',
  'Red' => 'Red',
  'Magenta' => 'Magenta',
  'Yellow' => 'Yellow',
  'White' => 'White',
  'BrightBlack' => 'BoldBlack',
  'BrightBlue' => 'BoldBlue',
  'BrightGreen' => 'BoldGreen',
  'BrightCyan' => 'BoldCyan',
  'BrightRed' => 'BoldRed',
  'BrightMagenta' => 'BoldMagenta',
  'BrightYellow' => 'BoldYellow',
  'BrightWhite' => 'BoldWhite',
  'DefaultForeground' => 'ForegroundColour',
  'DefaultBackground' => 'BackgroundColour',
  'Cursor' => 'CursorColour'
}
settings.each do |key, value|
  if mintty_key = color_map[key]
    mintty_settings[mintty_key] = value
  end
end
File.write(mintty_rc_path, mintty_settings.map { |key, value| [key,value].join('=') }.join("\n"))
