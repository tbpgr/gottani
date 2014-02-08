# encoding: utf-8
require 'active_support/concern'

module Gottani
  module Base
    extend ActiveSupport::Concern
    attr_accessor :indent_char, :separator

    module ClassMethods
      def define_to_common(base)
        define_method "#{base.to_s}_to_common".to_sym do |text|
          to_common text, indent_char, separator
        end
        alias_method "to_#{base.to_s}".to_sym, :to_indent_text
      end
    end

    def initialize
      @indent_char = get_indent_char
      @zero_start = zero_start?
      @separator = get_separator
    end

    def to_common(text, indent_char, separator = '')
      ret = []
      text.each_line.with_index do |line, index|
        chopped_line = line.chop
        line_hash = {}
        level = zero_start? ? indent_level(chopped_line) - 1 : indent_level(chopped_line)
        line_hash[:level] = level
        line_hash[:value] = indentless_line(chopped_line)
        line_hash[:value].gsub!(/^#{@separator}/, '') unless @separator.nil?
        ret << line_hash
      end
      ret
    end

    def to_indent_text(common)
      common.reduce([]) do |ret, line|
        level = zero_start? ? line[:level] + 1 : line[:level]
        indent = @indent_char * level
        indent = indent + @separator unless @separator.nil?
        ret << "#{indent}#{line[:value]}"
      end.join("\n") + "\n"
    end

    private

    def indent_level(line)
      prefix_indents = line.scan(/^#{@indent_char}*/).first
      prefix_indents = prefix_indents.nil? ? '' : prefix_indents
      prefix_indents.scan(@indent_char).size
    end

    def indentless_line(chopped_line)
      chopped_line.gsub(/^#{@indent_char}*/, '')
    end
  end
end
