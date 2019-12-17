# RailsParseHead

RailsParseHead is a simple Ruby library for parsing head element information from a website. 

Learn more about the protocol at: 
- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head
- https://github.com/joshbuchea/HEAD

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_parse_head'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_parse_head

## Usage

### Parsing an URL

```ruby
rph = RailsParseHead.fetch('https://github.com')
rph.title # => "The world’s leading software development platform · GitHub"
rph.metas # => [{:charset=>"utf-8"}, {:name=>"viewport", :content=>"width=device-width"}]
rph.links # => [{:rel=>"dns-prefetch", :href=>"https://github.githubassets.com"}, {:rel=>"dns-prefetch", :href=>"https://avatars0.githubusercontent.com"}]
```

#### Custom header request
```ruby
rph = RailsParseHead.fetch('https://github.com', headers: { accept: 'application/json' })
```

See: https://github.com/httprb/http/wiki/Headers

### Parsing a HTML string

```ruby
rph = RailsParseHead.parse("<meta charset='utf-8'>")
rph.metas # => [{:charset=>"utf-8"}]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BorisBresciani/rails_parse_head. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsParseHead project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_parse_head/blob/master/CODE_OF_CONDUCT.md).
