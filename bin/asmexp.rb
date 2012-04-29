#!/usr/bin/env ruby
require 'wx'
require 'open3'
require 'nokogiri'

$ref = {}
@xml = Nokogiri::XML.parse(IO.read("x86reference.xml"))
@xml.xpath("//entry").each do |entry|
  ins = entry.xpath("./syntax/mnem").text
  brief = entry.xpath("./note/brief").text
  $ref[ins] = brief unless ins.empty?
end

class Comp < Wx::Frame
  def initialize
    super(nil, 0, "Assembly explorer", Wx::DEFAULT_POSITION, Wx::Size.new(800, 600))
    sizer = Wx::FlexGridSizer.new(1, 3)
    sizer.add_growable_row(0)
    sizer.add_growable_row(2)
    sizer.add_growable_col(0)
    sizer.add_growable_col(1)
    text = "float f(float a) {\n  return a * 2.32323;\n}"

    @font = Wx::Font.new(10, Wx::FONTFAMILY_TELETYPE, Wx::FONTSTYLE_NORMAL, Wx::FONTWEIGHT_NORMAL, false, "Consolas")

    @code = Wx::StyledTextCtrl.new(self, 0, Wx::DEFAULT_POSITION, Wx::DEFAULT_SIZE)
    @code.text = text
    setup_sci
    sizer.add(@code, 1, Wx::EXPAND)

    @flags = Wx::TextCtrl.new(self, 1, "-masm=intel -O2")
    @flags.font = @font
    sizer.add(@flags, 1, Wx::EXPAND)
    
    # @assembly = Wx::TextCtrl.new(self, 2, "", Wx::DEFAULT_POSITION, Wx::DEFAULT_SIZE, Wx::TE_MULTILINE | Wx::TE_READONLY)
    @assembly = Wx::StyledTextCtrl.new(self, 2)
    @assembly.style_set_font Wx::STC_STYLE_DEFAULT, @font
    
    sizer.add(@assembly, 7, Wx::EXPAND)
    self.sizer = sizer
    evt_stc_change(@code) { |*a|
      @timer.start(500, true)
    }
    @timer = Wx::Timer.new(self)
    @error_list = {}

    evt_timer(@timer) {
      text = @code.text
      File.open("temp.cpp", "wb") { |f| f.write(text) }
      errors = nil
      begin
        Open3.popen3("gcc -S #{@flags.value} -o - temp.cpp") { |input, output, error, id|
          errors = error.read
          @assembly.text = output.read + errors
        }
      rescue Exception => e
        message = "#{e.backtrace.first}: #{e.message} (#{e.class})"
        message = [message,*e.backtrace[1..-1]].join("\n\t")
        @assembly.text = message
        errors = ""
      end
      @code.start_styling(0, 0xE0)
      @code.set_styling(@code.text.length, 0x00)
      
      @error_list = {}
      
      errors.scan /^temp.cpp:(\d+)(?::(\d+))?: (.*)/ do |line, col, msg|
        line = line.to_i
        col = col.to_i
        pos = @code.position_from_line(line - 1) + col - 1
        endpos = @code.get_line_end_position(line - 1)
        endpos = pos if endpos < pos
        @error_list[line] = msg
        @code.start_styling(pos, 0xE0)
        @code.set_styling(endpos-pos, 0x20)
      end
    }

    evt_text(@flags) {
      @timer.start(500, true)
    }

    @code.set_mouse_dwell_time(250)
    evt_stc_dwellstart(@code) { |*ev|
      line = @code.line_from_position(ev.first.position)
      if msg = @error_list[line+1]
        @code.call_tip_show(ev.first.position, msg)
      end
    }
    evt_stc_dwellend(@code) { @code.call_tip_cancel }


    @assembly.set_mouse_dwell_time(250)
    evt_stc_dwellstart(@assembly) { |ev|
      word_start = @assembly.word_start_position(ev.position, true)
      word_end = @assembly.word_end_position(ev.position, true)
      ins = @assembly.get_text_range(word_start, word_end).upcase
      if brief = $ref[ins]
        @assembly.call_tip_show(ev.position, brief)
      end
    }
    evt_stc_dwellend(@assembly) {
      @assembly.call_tip_cancel
    }
    
    maximize(true)
    
    # sizer.fit(self)
  end

  def setup_sci
    @code.style_set_font(Wx::STC_STYLE_DEFAULT, @font);

    @ws_visible = false
    @eol_visible = false
    @code.set_edge_mode(Wx::STC_EDGE_LINE)

    line_num_margin = @code.text_width(Wx::STC_STYLE_LINENUMBER, "_99999")
    @code.set_margin_width(0, line_num_margin)
    @code.style_set_foreground(Wx::STC_STYLE_DEFAULT, Wx::BLACK);
    @code.style_set_background(Wx::STC_STYLE_DEFAULT, Wx::WHITE);
    @code.style_set_foreground(Wx::STC_STYLE_LINENUMBER, Wx::LIGHT_GREY);
    @code.style_set_background(Wx::STC_STYLE_LINENUMBER, Wx::WHITE);
    @code.style_set_foreground(Wx::STC_STYLE_INDENTGUIDE, Wx::LIGHT_GREY);

    @code.set_tab_width(4)
    @code.set_use_tabs(false)
    @code.set_tab_indents(true)
    @code.set_back_space_un_indents(true)
    @code.set_indent(4)
    @code.set_edge_column(80)

    @code.set_lexer(Wx::STC_LEX_CPP)
    @code.style_clear_all
    @code.style_set_foreground(2, Wx::RED)
    @code.style_set_foreground(3, Wx::GREEN)
    @code.style_set_foreground(5, Wx::BLUE)
    @code.style_set_foreground(6, Wx::BLUE)
    @code.style_set_foreground(7, Wx::BLUE)
    @code.style_set_background(8, Wx::RED)

    @code.set_key_words(0, "alignas alignof and and_eq asm auto(1)
    bitand bitor bool break case catch char char16_t char32_t class
    compl const constexpr const_cast continue decltype default(1)
    delete(1) do double dynamic_cast else enum explicit export extern
    false float for friend goto if inline int long mutable namespace
    new noexcept not not_eq nullptr operator or or_eq private
    protected public register reinterpret_cast return short signed
    sizeof static static_assert static_cast struct switch template
    this thread_local throw true try typedef typeid typename union
    unsigned using virtual void volatile wchar_t while xor xor_eq")

    @code.set_property("fold","1")
    @code.set_property("fold.compact", "0")
    @code.set_property("fold.comment", "1")
    @code.set_property("fold.preprocessor", "1")

    @code.set_margin_width(1, 0)
    @code.set_margin_type(1, Wx::STC_MARGIN_SYMBOL)
    @code.set_margin_mask(1, Wx::STC_MASK_FOLDERS)
    @code.set_margin_width(1, 20)

    @code.marker_define(Wx::STC_MARKNUM_FOLDER, Wx::STC_MARK_PLUS)
    @code.marker_define(Wx::STC_MARKNUM_FOLDEROPEN, Wx::STC_MARK_MINUS)
    @code.marker_define(Wx::STC_MARKNUM_FOLDEREND, Wx::STC_MARK_EMPTY)
    @code.marker_define(Wx::STC_MARKNUM_FOLDERMIDTAIL, Wx::STC_MARK_EMPTY)
    @code.marker_define(Wx::STC_MARKNUM_FOLDEROPENMID, Wx::STC_MARK_EMPTY)
    @code.marker_define(Wx::STC_MARKNUM_FOLDERSUB, Wx::STC_MARK_EMPTY)
    @code.marker_define(Wx::STC_MARKNUM_FOLDERTAIL, Wx::STC_MARK_EMPTY)
    @code.set_fold_flags(16)

    @code.set_margin_sensitive(1,1)
  end
end

Wx::App.run do 
  self.app_name = 'Minimal'
  frame = Comp.new
  frame.show
end 
