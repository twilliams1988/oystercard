require 'journey'

describe Journey do

  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  describe '#journeys' do
    it 'has an empty list of journeys as default' do
      expect(subject.journeys).to be_empty
    end

    it 'returns a users journey as a hash' do
      subject.add_entry(entry_station)
      subject.add_exit(exit_station)
      expect(subject.journeyhistory).to include journey
    end
   end

  describe '#fare' do
    it 'returns min fare when tapped in and out' do
    subject.add_entry(entry_station)
    subject.add_exit(exit_station)
    expect(subject.fare).to eq Oystercard::MINIMUM_FARE
  end

  it 'returns penalty fare when not tapped in' do
    subject.add_exit(exit_station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns penalty fare when not tapped out' do
    subject.add_entry(entry_station)
    subject.add_entry(entry_station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end
end
