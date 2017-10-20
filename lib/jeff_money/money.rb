module JeffMoney
  class Money
    class << self
      attr_reader :conversions, :master_currency

      def conversion_rates(master_currency, conversions)
        @master_currency = master_currency
        @conversions = conversions.merge(master_currency => 1)
      end
    end

    attr_reader :amount, :currency

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

    private

    def valid_currency?(currency)
      known_currency.include?(currency)
    end

    def known_currency
      @known_currency ||= self.class.conversions.keys
    end
  end
end
