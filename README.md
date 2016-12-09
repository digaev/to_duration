# to_duration

[![Gem Version](https://badge.fury.io/rb/to_duration.svg)](https://badge.fury.io/rb/to_duration) [![Build Status](https://travis-ci.org/digaev/to_duration.svg)](https://travis-ci.org/digaev/to_duration) [![Coverage Status](https://coveralls.io/repos/github/digaev/to_duration/badge.svg?branch=master)](https://coveralls.io/github/digaev/to_duration?branch=master)

A Ruby gem for converting seconds into human-readable format. This gem adds instance method `#to_duration` to `Numeric`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_duration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_duration

## #to_duration(options = {})

* **Options**

| Name | Type | Default |
|---|:-:|:-:|
| `:year` | Boolean | `true` |
| `:month` | Boolean | `true` |
| `:week` | Boolean | `false` |
| `:day` | Boolean | `true` |
| `:hour` | Boolean  | `true` |
| `:minute` | Boolean | `true` |
| `:second` | Boolean | `true` |

## Usage

```ruby
irb(main):001:0> 12345.to_duration
=> "3 hours, 25 minutes and 45 seconds"

irb(main):002:0> 1234567890.to_duration
=> "39 years, 1 month, 14 days, 5 hours, 31 minutes and 30 seconds"

irb(main):003:0> 1234567890.to_duration(week: true)
=> "39 years, 1 month, 2 weeks, 5 hours, 31 minutes and 30 seconds"
```

## Localization

The gem uses [I18n](https://github.com/svenfuchs/i18n) for localization, so you just need to setup it :) Then add these lines into your tranlsations file(if you use Rails edit `config/locales/#{locale}.yml`):

```yml
to_duration:
  and: and
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/digaev/to_duration.
