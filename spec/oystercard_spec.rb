require 'oystercard'

describe OysterCard do

  subject(:oystercard) { described_class.new }

  describe '#initialize' do

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance amount by the top_up value' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
  end

end
