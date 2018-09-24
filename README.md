# to_duration

[![Gem Version](https://badge.fury.io/rb/to_duration.svg)](https://badge.fury.io/rb/to_duration) [![Build Status](https://travis-ci.org/digaev/to_duration.svg)](https://travis-ci.org/digaev/to_duration) [![Coverage Status](https://coveralls.io/repos/github/digaev/to_duration/badge.svg?branch=master)](https://coveralls.io/github/digaev/to_duration?branch=master)

A Ruby gem for converting seconds into human-readable format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_duration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_duration

## Usage

Just call `#to_duration` method on any `Numeric` instance.

```ruby
irb(main):001:0> 12345.to_duration
=> "3 hours, 25 minutes and 45 seconds"

irb(main):002:0> 1234567890.to_duration
=> "39 years, 1 month, 14 days, 5 hours, 31 minutes and 30 seconds"

irb(main):003:0> 1234567890.to_duration(weeks: true)
=> "39 years, 1 month, 2 weeks, 5 hours, 31 minutes and 30 seconds"

irb(main):004:0> 0.5.to_duration
=> "Less than one second"
```

### #to_duration(options = {})

| Option | Type | Default |
|---|:-:|:-:|
| `:years` | Boolean | `true` |
| `:months` | Boolean | `true` |
| `:weeks` | Boolean | `false` |
| `:days` | Boolean | `true` |
| `:hours` | Boolean | `true` |
| `:minutes` | Boolean | `true` |
| `:seconds` | Boolean | `true` |

**Notice:** Before version `1.2.0` these keys were singular.

## Localization

The gem uses [I18n](https://github.com/svenfuchs/i18n) for localization.

```yml
en: # Replace this key with your locale
  to_duration:
    and: and
    less_than_one_second: Less than one second
    year:
      one: year
      other: years
    month:
      one: month
      other: months
    week:
      one: week
      other: weeks
    day:
      one: day
      other: days
    hour:
      one: hour
      other: hours
    minute:
      one: minute
      other: minutes
    second:
      one: second
      other: seconds
```

If you're on Rails you may create `config/locales/to_duration_#{locale}.yml` file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/digaev/to_duration.
