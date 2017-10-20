module JeffMoney
  VERSION = '0.0.0'.freeze

  class UnkownCurrency < StandardError; end
end

require_relative 'jeff_money/money.rb'
