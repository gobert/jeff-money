ENV['RUBY_ENV'] = 'test'

require_relative '../lib/jeff_money.rb'

RSpec.configure do |config|
  config.order = 'random'
end
