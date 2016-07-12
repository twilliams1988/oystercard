require 'oystercard'

describe Oystercard do
  let(:card_with_money) { Oystercard.new(10) }

    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
  describe '#top_up' do
   it 'tells you when you top up' do
       expect{subject.top_up(1)}.to change{subject.balance}.by(1)
      end
   end

   it 'tells you there is a £90 limit' do
       maximum_balance = Oystercard::MAXIMUM_BALANCE
       card = Oystercard.new(maximum_balance)
       expect{card.top_up(maximum_balance)}.to raise_error "Card limited to £#{maximum_balance}"
   end

  describe '#deduct' do
    it 'deducts that fare' do
      card = Oystercard.new(Oystercard::MAXIMUM_BALANCE)
      expect{card.deduct(1)}.to change{card.balance}.by(-1)
    end
  end

  describe '#touch_in' do

    it 'starts the journey' do
      expect(card_with_money.touch_in).to eq true
    end
    it 'raises error if balance less than £1 while touching in' do
      expect{subject.touch_in}.to raise_error 'Insufficient balance'
    end
  end

  describe '#touch_out' do
    it 'end the journey' do
      expect(subject.touch_out).to eq false
    end
  end

  describe '#in_journey?' do
    it "Is initally not in journey" do
      expect(subject).not_to be_in_journey
    end
    it 'checks if the user is in journey' do
      card_with_money.touch_in
      expect(card_with_money).to be_in_journey
    end
    it 'checks if the user isn\'t in journey' do
      card_with_money.touch_in
      card_with_money.touch_out
      expect(card_with_money).not_to be_in_journey
    end
  end
end
