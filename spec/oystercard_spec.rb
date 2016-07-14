require 'oystercard'

describe OysterCard do


  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey){ {:entry_station => entry_station, :exit_station => exit_station} }
  let(:halfjourney) { {:entry_station => entry_station} }


  describe '#initialize' do

    it 'has an initial balance of 0' do
      card = OysterCard.new
      expect(card.balance).to eq 0
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

  describe '#touch_in' do
    it 'raises error if balance is too low' do
      expect {subject.touch_in("Liverpool Street")}.to raise_error "Your balance does not meet min fare"
    end
    it "checks if our current journey only contains an entry_station it pushes it to the journey_history" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_in(entry_station)
      expect(subject.journey_history).to include halfjourney
    end
  end


 describe '#touch_out' do

   before do
     subject.top_up(10)
     subject.touch_in(entry_station)
   end

   it 'deducts £1 from balance on touch out' do
   expect {subject.touch_out(exit_station)}.to change {subject.balance}.by(-Journey::MIN_FARE)
   end

 end

describe 'get_history' do

  before do
    subject.top_up(10)
    subject.touch_in(entry_station)
  end

 it 'returns journey history' do
   subject.touch_out(exit_station)
   expect(subject.journey_history).to include journey

 end

end

end
