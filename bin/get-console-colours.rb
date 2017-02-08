#!/usr/bin/env ruby
require 'win32/registry'
color_map = {
  'ColorTable00' => 'Black',
  'ColorTable01' => 'Blue',
  'ColorTable02' => 'Green',
  'ColorTable03' => 'Cyan',
  'ColorTable04' => 'Red',
  'ColorTable05' => 'Magenta',
  'ColorTable06' => 'Yellow',
  'ColorTable07' => 'White',
  'ColorTable08' => 'BrightBlack',
  'ColorTable09' => 'BrightBlue',
  'ColorTable10' => 'BrightGreen',
  'ColorTable11' => 'BrightCyan',
  'ColorTable12' => 'BrightRed',
  'ColorTable13' => 'BrightMagenta',
  'ColorTable14' => 'BrightYellow',
  'ColorTable15' => 'BrightWhite'
}

Win32::Registry::HKEY_CURRENT_USER.open('Console') do |console|
  screen_colours = nil
  colours = []
  console.each do |value_name,value_type,value_data|
    if generic_key = color_map[value_name]
      r = (value_data) % 256
      g = (value_data >> 8) % 256
      b = (value_data >> 16) % 256
      rgb = [r,g,b].join(',')
      printf "%s=%s\n", generic_key, rgb
      colours[value_name[/\d+/].to_i] = rgb
    elsif value_name == 'ScreenColors'
      screen_colours = value_data
    end
  end
  if screen_colours != nil
    default_foreground_index = screen_colours % 16
    if rgb = colours[default_foreground_index]
      puts "DefaultForeground=#{rgb}"
    end
    default_background_index = (screen_colours >> 4) % 16
    if rgb = colours[default_background_index]
      puts "DefaultBackground=#{rgb}"
    end
  end
end
