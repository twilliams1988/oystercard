require 'oystercard'

describe OysterCard do

  subject(:oystercard) { described_class.new }

  describe '#initialize' do

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#top_up' do
    it 'increases the balance amount by the top_up value' do
      expect {subject.top_up(5)}.to change {subject.balance}.by 5
    end

    it 'has a maximum limit of £90' do
      maxbalance = OysterCard::MAX_LIMIT
      maxlimiterror = "Top-up exceeds £#{maxbalance} max card limit"
      expect {subject.top_up(maxbalance + 1)}.to raise_error maxlimiterror
    end
  end

  # describe '#deduct' do
  #   it 'decreases the balance amount by the deduct value' do
  #   expect {subject.deduct(5)}.to change {subject.balance}.by -5
  #   end
  # end

  # before do
  #   subject.top_up(10)
  #   subject.touch_in
  # end

 describe '#touch_in' do
   it 'can touch in' do
   subject.top_up(10)
   subject.touch_in
   expect(subject).to be_in_journey
   end
 end

 describe '#touch_out' do
   it 'sets in_journey to false' do
   subject.top_up(10)
   subject.touch_in
   subject.touch_out
   expect(subject).not_to be_in_journey
   end

   it 'deducts £4 from balance on touch out' do
   subject.top_up(10)
   subject.touch_in
   expect {subject.touch_out}.to change {subject.balance}.by(-OysterCard::MIN_FARE)
   end

 end

end
