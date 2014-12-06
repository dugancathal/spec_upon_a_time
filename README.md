# SpecUponATime

A RSpec 3 style formatter that prints specs in documentation format with the
time it took to run each spec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spec_upon_a_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spec_upon_a_time

## Usage

Run your specs with the formatter set:

    $ bundle exec rspec --format SpecUponATime::Formatter

Or add it to your `.rspec` file:

    --format SpecUponATime::Formatter

## Contributing

1. Fork it ( https://github.com/dugancathal/spec_upon_a_time/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
