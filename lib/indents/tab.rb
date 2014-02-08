# encoding: utf-8
require 'indents/base'

module Gottani
  class Tab
    include Base

    define_to_common :tab

    def get_indent_char
      "\t"
    end

    def zero_start?
      false
    end

    def get_separator
      nil
    end
  end
end
