# Gottani

Gottani is coverter for indent-style text.

## Support type

* Tab indent
* Space2 indent
* Space4 indent
* Markdown indent

## Installation

Add this line to your application's Gemfile:

    gem 'gottani'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gottani

## Usage
### Convert List
| type          | convert_type key                | convert_method_name |
|:-----------   |:------------                    |:------------        |
|tab-indent     |Gottani::Core.new :tab, text     |to_tab               |
|space2-indent  |Gottani::Core.new :space2, text  |to_space2            |
|space4-indent  |Gottani::Core.new :space4, text  |to_space4            |
|markdown       |Gottani::Core.new :markdown, text|to_markdown          |

### tab-indent to space2 indent

~~~ruby
require 'gottani_core'

text =<<-EOS
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

gottani_core = Gottani::Core.new :tab, text
gottani_core.to_space2
~~~

output
~~~
root
  child1
    child1_1
      child1_1_1
      child1_1_2
    child1_2
  child2
    child2_1
  child3
~~~

### space2 to space4 indent

~~~ruby
require 'gottani_core'

text =<<-EOS
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

gottani_core = Gottani::Core.new :space2, text
gottani_core.to_space4
~~~

output
~~~
root
    child1
        child1_1
            child1_1_1
            child1_1_2
        child1_2
    child2
        child2_1
    child3
~~~

### space4 to Markdown indent

~~~ruby
require 'gottani_core'

text =<<-EOS
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

gottani_core = Gottani::Core.new :space4, text
gottani_core.to_markdown
~~~

output
~~~
# root
## child1
### child1_1
#### child1_1_1
#### child1_1_2
### child1_2
## child2
### child2_1
## child3
~~~

## History
* version 0.0.1  : first release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
