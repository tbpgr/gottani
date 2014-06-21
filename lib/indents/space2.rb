# encoding: utf-8
require 'indents/base'

module Gottani
  class Space2
    include Base
    define_to_common :space2

    def indent_char
      '  '
    end

    def zero_start?
      false
    end

    def separator
      nil
    end
  end
end
