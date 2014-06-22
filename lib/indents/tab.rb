# encoding: utf-8
require 'indents/base'

module Gottani
  # Gottani::Tab
  class Tab
    include Base

    define_to_common :tab

    def indent_char
      "\t"
    end

    def zero_start?
      false
    end

    def separator
      nil
    end
  end
end
