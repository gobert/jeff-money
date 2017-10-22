describe JeffMoney::Money do
  before { described_class.conversion_rates('EUR', 'FRF' => 6.5, 'DM' => 2) }

  describe '.initialize' do
    let(:attrs) { [20, 'EUR'] }

    it 'returns a Money object' do
      expect(described_class.new(*attrs)).to be_a(described_class)
    end

    context 'having an unknown currency' do
      let(:attrs) { [20, 'ABC'] }

      it 'raises en error' do
        expect { described_class.new(*attrs) }
          .to raise_error(JeffMoney::UnkownCurrency)
      end
    end
  end

  describe '#convert_to' do
    let(:amount_origin)   { 1 }
    let(:currency_origin) { 'EUR' }
    let(:money) { described_class.new(1, 'EUR') }

    context 'converting to UnkownCurrency' do
      it 'raises en error' do
        expect { money.convert_to('CAP') }
          .to raise_error(JeffMoney::UnkownCurrency)
      end
    end

    context 'converting to same currency' do
      it 'keeps the same amount' do
        expect(money.convert_to(money.currency).amount).to eq(money.amount)
      end

      it 'keeps the same currency' do
        expect(money.convert_to(money.currency).currency).to eq(money.currency)
      end
    end

    context 'converting to another currency' do
      let(:new_currency) { 'DM' }

      it 'converts the amount' do
        expect(money.convert_to(new_currency).amount).to eq(2)
      end

      it 'use the new currency' do
        expect(money.convert_to(new_currency).currency).to eq(new_currency)
      end
    end
  end

  describe '#inspect' do
    let(:twenty_eur) { described_class.new(20.00, 'EUR') }

    context 'rounding 19.994 EUR' do
      it 'returns 19.99 EUR' do
        money = twenty_eur - described_class.new(0.006, 'EUR')
        expect(money.inspect).to eq('19.99 EUR')
      end
    end

    context 'rounding 19.995 EUR' do
      it 'returns 20.00 EUR' do
        money = twenty_eur - described_class.new(0.005, 'EUR')
        expect(money.inspect).to eq('20.00 EUR')
      end
    end

    context 'rounding 20.000 EUR' do
      it 'returns 20.00 EUR' do
        expect(described_class.new(20.000, 'EUR').inspect).to eq('20.00 EUR')
      end
    end

    context 'rounding 20.004 EUR' do
      it 'returns 20.00 EUR' do
        money = twenty_eur + described_class.new(0.004, 'EUR')
        expect(money.inspect).to eq('20.00 EUR')
      end
    end

    context 'rounding 20.005 EUR' do
      it 'returns 20.01 EUR' do
        money = twenty_eur + described_class.new(0.005, 'EUR')
        expect(money.inspect).to eq('20.01 EUR')
      end
    end
  end

  describe '#==' do
    let(:twenty_eur) { described_class.new(20.00, 'EUR') }
    let(:border_inf) { described_class.new(0.004, 'EUR') }
    let(:border_sup) { described_class.new(1, 'EUR') }

    context 'comparing with +0.004' do
      it 'is equal' do
        expect(twenty_eur == border_inf + twenty_eur).to eq(true)
      end
    end

    context 'comparing with +0.005' do
      it 'is not equal' do
        expect(twenty_eur == border_sup + twenty_eur).to eq(false)
      end
    end

    context 'comparing with -0.004' do
      it 'is equal' do
        expect(twenty_eur == -border_inf + twenty_eur).to eq(true)
      end
    end

    context 'comparing with -0.005' do
      it 'is not equal' do
        expect(twenty_eur == - border_sup + twenty_eur).to eq(false)
      end
    end
  end
end
