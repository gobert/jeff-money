# Contributing

# Test
On top of each commit, each test must pass
```
bundle exec rspec -- spec/
```

# Code quality
On top of each commit, no offenses must be detected
```
bundle exec rubocop -c .rubocop-validation.yml -- .
```
