#!/usr/bin/env ruby
require 'win32/registry'
settings = Hash[STDIN.each_line.map { |ln| ln.chomp.split('=') }]
color_map = {
  'DefaultForeground' => 'Colour0',
  'DefaultBoldForeground' => 'Colour1',
  'DefaultBackground' => 'Colour2',
  'DefaultBoldBackground' => 'Colour3',
  'CursorText' => 'Colour4',
  'Cursor' => 'Colour5',
  'Black' => 'Colour6',
  'BrightBlack' => 'Colour7',
  'Red' => 'Colour8',
  'BrightRed' => 'Colour9',
  'Green' => 'Colour10',
  'BrightGreen' => 'Colour11',
  'Yellow' => 'Colour12',
  'BrightYellow' => 'Colour13',
  'Blue' => 'Colour14',
  'BrightBlue' => 'Colour15',
  'Magenta' => 'Colour16',
  'BrightMagenta' => 'Colour17',
  'Cyan' => 'Colour18',
  'BrightCyan' => 'Colour19',
  'White' => 'Colour20',
  'BrightWhite' => 'Colour21'
}
Win32::Registry::HKEY_CURRENT_USER.open('SOFTWARE\SimonTatham\PuTTY\Sessions\Default%20Settings', Win32::Registry::KEY_WRITE) do |putty|
  settings.each do |key, value|
    if putty_key = color_map[key]
      putty[putty_key] = value
    end
  end
end
