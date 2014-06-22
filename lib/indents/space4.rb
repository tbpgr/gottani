# encoding: utf-8
require 'indents/base'

module Gottani
  # Gottani::Space4
  class Space4
    include Base
    define_to_common :space4

    def indent_char
      '    '
    end

    def zero_start?
      false
    end

    def separator
      nil
    end
  end
end
