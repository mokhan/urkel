# Urkel

![Steve Urkel](http://upload.wikimedia.org/wikipedia/en/d/da/2005_0308_urkel.jpg)

Ooops... did I do that?

The urkel gem is a client library that allows you to publish errors
to an [urkel](https://github.com/mokhan/urkel-api) instance.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'urkel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urkel

## Usage

  # place in initializer
  Urkel.configure do |configuration|
    configuration.api_host = 'http://localhost:3000'
    configuration.api_key = '02513a35-b875-40a1-a1fc-f2d2582bdcc5'
  end

  # usage
  begin 
    0/1
  rescue StandardError => error
    Urkel.oops(error)
  end

## Contributing

1. Fork it ( https://github.com/mokhan/urkel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
