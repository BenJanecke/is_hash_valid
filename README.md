# IsHashValid

A simple hash validator that allows you to do complex validations with custom error messages.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_hash_valid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_hash_valid

## Usage

### Roll your own validator 

```ruby
class SnobbyValidator < IsHashValid::Validator
  def initialize(hash)
    super hash {
      name: {
        be_royal: "Must be of royalty"
      },
      age: {
        over18: "No minors allowed"
      }
    }
  end

  def over18(value)
    value > 18
  end

  def be_royal(value)
    value.scan(/King|Queen/).empty? ? false : true
  end
end

valid = SnobbyValidator.new({ name: 'King Richard', age: 9001 })
invalid = SnobbyValidator.new({ name: 'Timmy', age: 8 })

valid.valid? #true
valid.errors # {}

invalid.valid? #false
invalid.errors # { errors: { name: [ "Must be of royalty "], age: "No minors allowed" } }

```

### Or use some of the baked in validators

```ruby
invalid = IsHashValid::Validator.new({ name: 2 }, { 
  name: {
    not_empty: "Name may not be empty",
    be_string: "Name must be a string"
  } 
})

invalid.valid? #false
invalid.errors # { errors: { name: [ "Name may not be empty", "Name must be a string" ] } }
```

Current baked in validators are 

* not_empty
* be_string
* required

## Contributing

1. Fork it ( https://github.com/[my-github-username]/is_hash_valid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
