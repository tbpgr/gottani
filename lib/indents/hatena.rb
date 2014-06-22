# encoding: utf-8
require 'indents/base'

module Gottani
  # Gottani::Hatena
  class Hatena
    include Base
    define_to_common :hatena

    def indent_char
      '*'
    end

    def zero_start?
      true
    end

    def separator
      nil
    end
  end
end
