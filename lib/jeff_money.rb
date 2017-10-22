module JeffMoney
  VERSION = '0.0.0'.freeze

  class UnkownCurrency < StandardError; end

  module Helpers
    def self.number_with_precision(number, desired_precision)
      rounded_number = number.round(desired_precision)

      current_precision = rounded_number.to_s.split('.').last.size
      if current_precision < desired_precision
        rounded_number.to_s + '0' * (desired_precision - current_precision)
      else
        rounded_number.to_s
      end
    end
  end
end

require_relative 'jeff_money/money.rb'
