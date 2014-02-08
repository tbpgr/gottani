# encoding: utf-8
require 'spec_helper'
require 'indents/tab'

describe Gottani::Tab do
  class ConcreteTab
    attr_reader :text, :common

    def initialize(text)
      @text = text
      @common = Gottani::Tab.new.tab_to_common text
    end
  end

  context :tab_to_common do
    CASE1_INPUT = <<-EOS
root
	child1
		child1_1
			child1_1_1
			child1_1_2
		child1_2
	child2
		child2_1
	child3
    EOS
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        klass: ConcreteTab,
        input: CASE1_INPUT,
        expected: [
          {
            level: 0,
            value: 'root'
          },
          {
            level: 1,
            value: 'child1'
          },
          {
            level: 2,
            value: 'child1_1'
          },
          {
            level: 3,
            value: 'child1_1_1'
          },
          {
            level: 3,
            value: 'child1_1_2'
          },
          {
            level: 2,
            value: 'child1_2'
          },
          {
            level: 1,
            value: 'child2'
          },
          {
            level: 2,
            value: 'child2_1'
          },
          {
            level: 1,
            value: 'child3'
          },
        ],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          tab = c[:klass].new c[:input]

          # -- when --
          actual = tab.common

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_tab do
    EXPECTED_TABTREE_CASE1 = <<-EOS
root
	child1
		child1_1
			child1_1_1
			child1_1_2
		child1_2
	child2
		child2_1
	child3
    EOS
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: [
          {
            level: 0,
            value: 'root'
          },
          {
            level: 1,
            value: 'child1'
          },
          {
            level: 2,
            value: 'child1_1'
          },
          {
            level: 3,
            value: 'child1_1_1'
          },
          {
            level: 3,
            value: 'child1_1_2'
          },
          {
            level: 2,
            value: 'child1_2'
          },
          {
            level: 1,
            value: 'child2'
          },
          {
            level: 2,
            value: 'child2_1'
          },
          {
            level: 1,
            value: 'child3'
          },
        ],
        expected: EXPECTED_TABTREE_CASE1
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          tab = Gottani::Tab.new

          # -- when --
          common = Gottani::Tab.new.tab_to_common c[:expected]
          actual = tab.to_tab common

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
