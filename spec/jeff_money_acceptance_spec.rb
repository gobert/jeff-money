describe JeffMoney do
  let(:twenty_dollars) { JeffMoney::Money.new(20, 'USD') }
  let(:fifty_eur)      { JeffMoney::Money.new(50, 'EUR') }

  before do
    JeffMoney::Money.conversion_rates('EUR', 'USD' => 1.11,
                                             'Bitcoin' => 0.0047)
  end

  describe '#convert_to' do
    it 'converts to 55.50 USD' do
      expect(fifty_eur.convert_to('USD').amount).to eq(55.50000000000001)
    end
  end

  describe '+' do
    it 'sums money of different currency' do
      expect(fifty_eur + twenty_dollars)
        .to eq(JeffMoney::Money.new(68.02, 'EUR'))
    end
  end

  describe '-' do
    it 'subtracts money of different currency' do
      expect(fifty_eur - twenty_dollars)
        .to eq(JeffMoney::Money.new(31.98, 'EUR'))
    end
  end

  describe '*' do
    it 'multiplies money by a factor' do
      expect(twenty_dollars * 3)
        .to eq(JeffMoney::Money.new(60, 'USD'))
    end
  end

  describe '/' do
    it 'divides money by a factor' do
      expect(fifty_eur / 2)
        .to eq(JeffMoney::Money.new(25, 'EUR'))
    end
  end

  describe '==' do
    context 'having same currency' do
      context 'comparing with the same amount' do
        it 'is equal' do
          expect(twenty_dollars == JeffMoney::Money.new(20, 'USD')).to eq(true)
        end
      end

      context 'comparing with a different amount' do
        it 'is not equal' do
          expect(twenty_dollars == JeffMoney::Money.new(30, 'USD')).to eq(false)
        end
      end
    end

    context 'having a different currency' do
      it 'has same value' do
        expect(fifty_eur.convert_to('USD') == fifty_eur).to eq(true)
      end
    end
  end

  describe '>' do
    context 'having same currency' do
      it 'compares the values' do
        expect(twenty_dollars > JeffMoney::Money.new(5, 'USD')).to be(true)
      end
    end
  end

  describe '<' do
    context 'not having same currency' do
      it 'compares the values' do
        expect(twenty_dollars < fifty_eur).to be(true)
      end
    end
  end
end
