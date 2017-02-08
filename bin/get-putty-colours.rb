#!/usr/bin/env ruby
require 'win32/registry'
color_map = {
  'Colour0' => 'DefaultForeground',
  'Colour1' => 'DefaultBoldForeground',
  'Colour2' => 'DefaultBackground',
  'Colour3' => 'DefaultBoldBackground',
  'Colour4' => 'CursorText',
  'Colour5' => 'Cursor',
  'Colour6' => 'Black',
  'Colour7' => 'BrightBlack',
  'Colour8' => 'Red',
  'Colour9' => 'BrightRed',
  'Colour10' => 'Green',
  'Colour11' => 'BrightGreen',
  'Colour12' => 'Yellow',
  'Colour13' => 'BrightYellow',
  'Colour14' => 'Blue',
  'Colour15' => 'BrightBlue',
  'Colour16' => 'Magenta',
  'Colour17' => 'BrightMagenta',
  'Colour18' => 'Cyan',
  'Colour19' => 'BrightCyan',
  'Colour20' => 'White',
  'Colour21' => 'BrightWhite'
}
Win32::Registry::HKEY_CURRENT_USER.open('SOFTWARE\SimonTatham\PuTTY\Sessions\Default%20Settings') do |console|
  console.each do |value_name,value_type,value_data|
    if generic_key = color_map[value_name]
      printf "%s=%s\n", generic_key, value_data
    end
  end
end
