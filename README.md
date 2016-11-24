# Skypescraper

Skypescraper is a little gem to extract messages from skype database.

Right now all it can only find conversation for a given skype identity, find participants of the conversation and list messages (only text messages, not things like "John Doe joined chat")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'skypescraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skypescraper

## Usage

```ruby
extractor = Skypescraper::Extractor.new('path/to/main.db')
conversation = extractor.conversations_for('john.doe')
participants = conversation.participants # array of participants
messages = conversation.messages # array of messages
````

## Changelog

0.0.2 - Fixed bug with wrong conversations memoization

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soundrussian/skypescraper.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

