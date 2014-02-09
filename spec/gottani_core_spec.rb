# encoding: utf-8
require 'spec_helper'
require 'gottani_core'

describe Gottani::Core do
  context :to_tab do
    TAB = <<-EOS
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

    SPACE2 = <<-EOS
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

    SPACE4 = <<-EOS
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

    MARKDOWN = <<-EOS
# root
## child1
### child1_1
#### child1_1_1
#### child1_1_2
### child1_2
## child2
### child2_1
## child3
    EOS

    HATENA = <<-EOS
*root
**child1
***child1_1
****child1_1_1
****child1_1_2
***child1_2
**child2
***child2_1
**child3
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'space2 to tab case',
        type: :space2,
        input: SPACE2,
        method_name: :to_tab,
        expected: TAB
      },
      {
        case_no: 2,
        case_title: 'tab to space2 case',
        type: :tab,
        input: TAB,
        method_name: :to_space2,
        expected: SPACE2
      },
      {
        case_no: 3,
        case_title: 'tab to space4 case',
        type: :tab,
        input: TAB,
        method_name: :to_space4,
        expected: SPACE4
      },
      {
        case_no: 4,
        case_title: 'tab to markdown case',
        type: :tab,
        input: TAB,
        method_name: :to_markdown,
        expected: MARKDOWN
      },
      {
        case_no: 5,
        case_title: 'markdown to tab case',
        type: :markdown,
        input: MARKDOWN,
        method_name: :to_tab,
        expected: TAB
      },
      {
        case_no: 6,
        case_title: 'markdown to hatena case',
        type: :markdown,
        input: MARKDOWN,
        method_name: :to_hatena,
        expected: HATENA
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          gottani_core = Gottani::Core.new c[:type], c[:input]

          # -- when --
          actual = gottani_core.send c[:method_name]

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
