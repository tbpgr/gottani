# encoding: utf-8
require 'indents/base'

module Gottani
  class Markdown
    include Base

    define_to_common :markdown

    def indent_char
      '#'
    end

    def zero_start?
      true
    end

    def separator
      ' '
    end
  end
end
