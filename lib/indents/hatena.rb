# encoding: utf-8
require 'indents/base'

module Gottani
  class Hatena
    include Base
    define_to_common :hatena

    def get_indent_char
      '*'
    end

    def zero_start?
      true
    end

    def get_separator
      nil
    end
  end
end
