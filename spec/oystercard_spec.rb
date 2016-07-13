require 'oystercard'

describe OysterCard do


  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey){ {entry_station => exit_station} }


  describe '#initialize' do

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq 0
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
   it 'can touch in' do
   subject.top_up(10)
   subject.touch_in(entry_station)
   #expect(subject).to be_in_journey
   end

   it 'stores the entry station' do
     subject.top_up(10)
     subject.touch_in(entry_station)
     expect(subject.entry_station).to eq entry_station

   end
 end

 describe '#touch_out' do

  #  it 'sets in_journey? to false' do
  #  subject.top_up(10)
  #  subject.touch_in(entry_station)
  #  expect{subject.touch_out(exit_station).to eq exit_station
  #  end

   it 'deducts £1 from balance on touch out' do
   subject.top_up(10)
   subject.touch_in(entry_station)
   expect {subject.touch_out(exit_station)}.to change {subject.balance}.by(-OysterCard::MIN_FARE)
   end

  #  it 'makes card forget entry station' do
  #    subject.top_up(10)
  #    subject.touch_in(entry_station)
  #    expect {subject.touch_out(exit_station)}.to change {subject.entry_station}.to eq nil
  #  end

   it 'can remember the exit station' do
   subject.top_up(10)
   subject.touch_in(entry_station)
   subject.touch_out(exit_station)
   expect(subject.exit_station).to eq exit_station
 end
 end

describe 'get_history' do

 it 'returns journey history' do

   subject.top_up(10)
   subject.touch_in(entry_station)
   subject.touch_out(exit_station)
   expect(subject.journey_history).to include journey

 end

end



end
