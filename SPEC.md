
We estimate the time needed to complete this task to be in the range of a few hours. During evaluation, we focus mostly on:

- Structure of the code
- Proper testing
- Consistency of the code style
- Correctness of the solution
- Simplicity vs. over-engineering

Here is your task:

Write a Ruby gem to perform currency conversion and arithmetics with different currencies (we know there are already gems for that, but for the sake of the exercise implement your own ;) ). The expected features and the usage of the gem should be something like this:

```ruby
# Configure the currency rates with respect to a base currency (here EUR):

Money.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
})

# Instantiate money objects:

fifty_eur = Money.new(50, 'EUR')

# Get amount and currency:

fifty_eur.amount   # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect  # => "50.00 EUR"

# Convert to a different currency (should return a Money
# instance, not a String):

fifty_eur.convert_to('USD') # => 55.50 USD

# Perform operations in different currencies:

twenty_dollars = Money.new(20, 'USD')

# Arithmetics:

fifty_eur + twenty_dollars # => 68.02 EUR
fifty_eur - twenty_dollars # => 31.98 EUR
fifty_eur / 2              # => 25 EUR
twenty_dollars * 3         # => 60 USD

# Comparisons (also in different currencies):

twenty_dollars == Money.new(20, 'USD') # => true
twenty_dollars == Money.new(30, 'USD') # => false

fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur_in_usd == fifty_eur          # => true

twenty_dollars > Money.new(5, 'USD')   # => true
twenty_dollars < fifty_eur             # => true
```

For the purpose of this exercise, when implementing equality, you can consider two monetary amounts as equal if they agree up to the cents.

You might want to namespace your gem not to conflict with existing gems with the same name.

Keep it simple, no need to support other features rather than these. The clearer your code the better. But please write tests or documentation whenever it makes sense. Think as if other people will have to use your gem or contribute to it.

Please note that the actual numbers here are based on the conversion rate at the time we wrote the task. With different rates you will get different numbers.
