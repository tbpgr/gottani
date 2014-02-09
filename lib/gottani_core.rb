# encoding: utf-8
require 'active_support/inflector'
require 'indents/tab'
require 'indents/space2'
require 'indents/space4'
require 'indents/markdown'
require 'indents/hatena'

module Gottani
  class Core
    attr_reader :type, :common
    FORMAT = {
      tab: Gottani::Tab,
      space2: Gottani::Space2,
      space4: Gottani::Space4,
      markdown: Gottani::Markdown,
      hatena: Gottani::Hatena,
    }

    def initialize(type, base)
      instance = FORMAT[type].new
      @common = instance.send "#{type.to_s}_to_common", base
    end

    def method_missing(method_name, *args, &block)
      method_name.match /^to_(.*)$/
      super unless Regexp.last_match[1]
      instance = FORMAT[Regexp.last_match[1].to_sym].new
      return instance.send("to_#{Regexp.last_match[1]}", @common) if instance
      super
    end
  end
end
