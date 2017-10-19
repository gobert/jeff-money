module JeffMoney
  class Money
    include Comparable

    class << self
      attr_reader :conversions, :master_currency

      def conversion_rates(master_currency, conversions)
        @master_currency = master_currency
        @conversions = conversions.merge(master_currency => 1)
      end
    end

    attr_accessor :amount, :currency

    def initialize(amount, currency)
      raise UnkownCurrency if !valid_currency?(currency)

      @amount = amount
      @currency = currency
    end

    def convert_to(new_currency)
      raise UnkownCurrency if !valid_currency?(new_currency)

      new_amount = amount.to_f /
                   self.class.conversions[currency] *
                   self.class.conversions[new_currency]

      Money.new(new_amount, new_currency)
    end

    def +(other)
      self.amount += other.convert_to(currency).amount

      self
    end

    def -(other)
      self.amount -= other.convert_to(currency).amount

      self
    end

    # rubocop:disable Naming/BinaryOperatorParameterName
    def *(coefficient)
      self.amount *= coefficient

      self
    end

    def /(coefficient)
      self.amount = self.amount.to_f / coefficient

      self
    end
    # rubocop:enable Naming/BinaryOperatorParameterName

    def <=>(other)
      rounded_amount = amount.to_f.round(2)
      other_rounded_amount = other.convert_to(currency).amount.to_f.round(2)

      if rounded_amount > other_rounded_amount
        1
      elsif rounded_amount < other_rounded_amount
        -1
      else
        0
      end
    end

    private

    def valid_currency?(currency)
      known_currency.include?(currency)
    end

    def known_currency
      @known_currency ||= self.class.conversions.keys
    end
  end
end
