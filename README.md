[![Travis build information for branch master](https://api.travis-ci.org/gobert/jeff-money.svg?branch=master)](https://travis-ci.org/gobert/jeff-money)
[![Dependency Status](https://gemnasium.com/gobert/jeff-money.svg)](https://gemnasium.com/gobert/jeff-money)
[![Security warnings](https://hakiri.io/github/gobert/jeff-money/master.svg)](https://hakiri.io/projects/081d4a8c843d0c)
[![Maintainability](https://api.codeclimate.com/v1/badges/7d845af6498d081c3256/maintainability)](https://codeclimate.com/github/gobert/jeff-money/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7d845af6498d081c3256/test_coverage)](https://codeclimate.com/github/gobert/jeff-money/test_coverage)

# Jeff currency

Gem that convert currency to each other.

# Usage
First you need to prepare the gem:
```ruby
Money = JeffMoney::Money
Money.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
})
```

Instantiate new objects:
```ruby
fifty_eur = Money.new(50, 'EUR')
```

Convert to a different currency
```ruby
fifty_eur.convert_to('USD') # => 55.50 USD
```

# Contribute
See [CONTRIBUTING.md](CONTRIBUTING.md)
