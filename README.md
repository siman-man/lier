# Lier

Lier reverses return value of method which end with '?'. (without `respond_to?`)

## Installation

install it yourself as:

```
$ gem install lier
```

## Usage

```ruby
require 'lier'

p (1..10).include?(3)     #=> true
p (1..10).include?(100)   #=> false
p [1, 2, 3].all?(&:odd?)  #=> false
p [1, 2, 3].any?(&:odd?)  #=> true

using Lier

p (1..10).include?(3)     #=> false
p (1..10).include?(100)   #=> true
p [1, 2, 3].all?(&:odd?)  #=> true
p [1, 2, 3].any?(&:odd?)  #=> false
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siman-man/lier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

