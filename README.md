# Tokiyomi

Japanese relative date/time string parser.

## Installation

Add this line to your application's Gemfile:

    gem 'tokiyomi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tokiyomi

## Usage

```
Time.now                  # => 2013-01-10T12:34:56
Tokiyomi.parse('10日前')  # => 2012-12-31T12:34:56
```

### Supported formats

* 年, 月, 日, 時間, 分, 秒 + [前後]

```
Tokiyomi.parse('10日前')    # => 2012-12-31T12:34:56
Tokiyomi.parse('3時間後')   # => 2013-01-10T15:34:56
```

* hour and minutes are also able to specified.

```
Tokiyomi.parse('2ヵ月前の20:00')   # => 2012-11-10T20:00:00
Tokiyomi.parse('1週間後の00:00')    # => 2013-01-17T00:00:00
```

* 今日, 明日, 明後日, 昨日, 一昨日

```
Tokiyomi.parse('明日')  # => 2013-01-11T12:34:56
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

