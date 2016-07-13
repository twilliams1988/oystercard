require 'journey'

describe Journey do

  # let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
  let(:station) { double :station, zone: 1}

  describe '#journeys' do
    it 'knows a journey is not complete' do
      expect(subject).not_to be_complete
    end

    it 'has a penalty fare by default' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns itself when finishing a journey' do
      expect(subject.finish(station)).to eq subject
    end

  context 'given an entry station' do
    subject { described_class.new(station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it 'returns a penalty fare if no exit station given' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station}

      before do
        subject.finish(other_station)
      end

      it 'calculates a fare' do
        expect(subject.fare).to eq 1
      end

      it 'knows if a journey is complete' do
        expect(subject).to be_complete
      end
    end

  end

    # it 'has an empty hash of journey as default' do
    #   expect(subject.journeys).to be_empty
    # end
    #
    # it 'returns a users journey as a hash' do
    #   subject.add_entry(entry_station)
    #   subject.add_exit(exit_station)
    #   expect(subject.journeys).to include journey
    # end
   end

#   describe '#fare' do
#     it 'returns min fare when tapped in and out' do
#     subject.add_entry(entry_station)
#     subject.add_exit(exit_station)
#     expect(subject.fare).to eq Oystercard::MINIMUM_FARE
#   end
#
#   it 'returns penalty fare when not tapped in' do
#     subject.add_exit(exit_station)
#     expect(subject.fare).to eq Journey::PENALTY_FARE
#   end
#
#   it 'returns penalty fare when not tapped out' do
#     subject.add_entry(entry_station)
#     subject.add_entry(entry_station)
#     expect(subject.fare).to eq Journey::PENALTY_FARE
#   end
# end
end
