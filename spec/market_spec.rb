require 'spec_helper'

describe 'Market' do
  let(:market) { Market.new }

  context 'basket' do
    it 'is empty at the start' do
      expect(market.basket).to eq 0
    end
  end

  context 'when there is no mutex lock' do
    it 'raises when error when the basket is less than zero' do
      expect{market.run_threads}.to raise_error "Basket empty!"
    end
  end
end
