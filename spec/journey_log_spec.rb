require 'journey_log'

describe JourneyLog do
  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:journey_class) { double :journey_class, new: journey }
  subject { described_class.new(journey_class: journey_class) }

  describe '#start' do

    it {is_expected.to respond_to(:start).with(1).argument}

    it 'starts a journey' do
      subject.start(station)
      expect(journey_class).to receive(:new).with(entry_station: station)
    end
  end


end
