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
end
