# Contributing

If you find **bugs**, please let me know with github issues.

If you want to add new features, just fork the repository and open a pull-request.

# Set Up
* Install ruby 2.4.1. For instance using rvm: ```rvm install 2.4.1```
* Install gem bundler: ```gem install bundler --no-ri --no-rdoc```
* Install dependencies: ```bundle install```

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
