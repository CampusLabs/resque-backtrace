# resque-backtrace

A simple gem to solve a simple problem: when an exception occurs
during a [Resque][] job, no backtrace is visibly logged.  In
production you probably want to use an exception catching service, but
in development you might just want to see the backtrace and fix the
issue.

**Note:** I've only tested this with with Resque 1.X---I'm not yet
aware if it's compatible with newer versions of Resque.

## Installation

Add this line to your application's Gemfile:

    gem 'resque-backtrace', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-backtrace

## Usage

If `resque-backtrace` is the only error handling strategy you want
use, open the file where you initialize Resque (possibly something like
`config/initializers/resque.rb`), and do the following:

```ruby
require 'resque/failure/backtrace'

Resque::Failure.backend = Resque::Failure::Backtrace
```

If you want to use multiple error handling strategies you'll need to
do something like this (which adds Redis for failures):

```ruby
require 'resque/failure/backtrace'
require 'resque/failure/multiple'
require 'resque/failure/redis'

failure_backends = [Resque::Failure::Redis]

if Rails.env.development?
  failure_backends << Resque::Failure::Backtrace
end

Resque::Failure::MultipleWithRetrySuppression.classes = failure_backends
Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: https://github.com/resque/resque
