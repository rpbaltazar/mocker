# Mocker

This gem is a data generation helper.
It gives you real data for different types, but from the unusual list of names, just for fun!

Currently only has locations available. More models will follow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mocker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mocker

## Usage

```ruby
require 'mocker'

# returns one possible place
Mocker::Place.name

# returns a place from the country code passed (e.g. Mocker::Place.name_in 'us')
Mocker::Place.name_in <2 letter country code>

# returns a name of a 'famous person'
Mocker::Name.famous_person

# returns a first name
Mocker::Name.first_name

# returns a last name
Mocker::Name.last_name
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mocker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
