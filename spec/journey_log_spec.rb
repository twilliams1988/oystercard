require 'journey_log'

describe JourneyLog do
  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:journey_class) { double :journey_class, new: journey }
  subject { described_class.new(journey_class: journey_class) }

  describe '#start' do

    it {is_expected.to respond_to(:start).with(1).argument}

    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include journey
    end

  end

  describe '#finish' do

    it { is_expected.to respond_to(:finish).with(1).argument }

    it 'finishes a journey by adding exit station and setting to nil' do
      subject.start(station)
      subject.finish(station)
      expect(subject.journeys).to include journey
    end

  end


end
