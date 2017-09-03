# RailsRemoteConsole

Rails Remote Console can help you enter Rails console from the remote server easily. This gem is currently support rbenv combined with Capistrano (2, 3) and Mina

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_remote_console'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_remote_console

## Usage

### Rails 5 and above

Simply trigger the following command to enter the remote rails console

```bash
[bundle exec] rails rc
```

The default environment is staging. If you want to have remote console to a specific environment:

```bash
[bundle exec] rails rc <environment>
```

For instance:

```bash
[bundle exec] rails rc production
```

### Rails 4 and above

```bash
[bundle exec] rake rc
```

The default environment is staging. If you want to have remote console to a specific environment:

```bash
[bundle exec] rake rc <environment>
```

For instance:

```bash
[bundle exec] rake rc production
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_remote_console. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsRemoteConsole project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_remote_console/blob/master/CODE_OF_CONDUCT.md).
