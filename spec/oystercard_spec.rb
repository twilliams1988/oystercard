require 'oystercard'

describe Oystercard do

    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
  describe '#top_up' do
   it 'tells you when you top up' do
       #expect(subject.top_up(1)).to eq 1 ======= Our code
       expect{subject.top_up(1)}.to change{subject.balance}.by(1)
      end
   end

   it 'tells you there is a £90 limit' do
       maximum_balance = Oystercard::MAXIMUM_BALANCE
       card = Oystercard.new(maximum_balance)
       expect{card.top_up(maximum_balance)}.to raise_error "card limited to £#{maximum_balance}"
   end

  describe '#deduct' do
    it 'deducts that fare' do
      card = Oystercard.new(Oystercard::MAXIMUM_BALANCE)
      expect{card.deduct(1)}.to change{card.balance}.by(-1)
    end
  end

  describe '#touch_in' do
    it 'starts the journey' do
      expect(subject.touch_in).to eq true
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
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'checks if the user isn\'t in journey' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
