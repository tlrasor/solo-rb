# Solo-rb

A ruby port of [Solo](https://www.timkay.com/solo/). Solo-rb is a pretty simple gem that prevents a program from running more than one copy at a time. It is useful with cron to make sure that a job doesn't run before a previous one has finished. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solo-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solo-rb

## Usage

solo --port=PORT -- COMMAND

where
    PORT        a port number to be used for locking. Must be less than 65535 and ports under 1024 are reserved for root
    COMMAND     shell command to run

options
    --silent     be silent

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tlrasor/solo-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
