# Proc::Value

[![Gem Version](https://img.shields.io/gem/v/proc-value?logo=ruby)](http://badge.fury.io/rb/proc-value)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jgraichen/proc-value/test.yml?logo=github)](https://github.com/jgraichen/proc-value/actions/workflows/test.yml)
[![Code Coverage](https://img.shields.io/codecov/c/gh/jgraichen/proc-value?logo=codecov)](https://codecov.io/gh/jgraichen/proc-value)

**Proc::Value** extends Ruby Objects with a Smalltalk like `#value` method that always returns the object except when called on a block. In this case the block will be evaluated and the result returned. This allows the transparent exchange of static object with lazy evaluated blocks e.g. for configuration classes.

```ruby
class Configuration
  def initialize(options)
    @options = options
  end

  def path
  	@options[:path].value.to_s
  end
end

config1 = Configuration.new path: proc { "config/#{RAILS_ENV}/config.yml" }
config2 = Configuration.new path: 'config/config.yml'

config1.path # `path` block will be evaluated here!
             # => "config/development/config.yml"
config2.path # Same code. No extra if statement needed.
             # => "config/config.yml"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proc-value'
```

And then execute:

```console
bundle
```

Or install it yourself as:

```console
gem install proc-value
```

## Usage

See example above.

You can also use `Proc.val(proc_or_object)` that does not depend on any injected method and only looks if given object implements a `#call` method or not.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add specs for your feature
4. Add and commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
