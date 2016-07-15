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

    it 'logs if current journey exists (touch in twice)' do
      journey = JourneyLog.new(journey_class: Journey)
      journey.start(station)
      expect {journey.start(station)}.to change {journey.log.length}.by 1
    end

  end

  describe '#finish' do

    it { is_expected.to respond_to(:finish).with(1).argument }

    it 'finishes a journey' do
      subject.start(station)
      expect(journey).to receive(:finish).with(exit_station: station)
      subject.finish(station)
    end

    it 'logs the current journey' do
      journey = JourneyLog.new(journey_class: Journey)
      journey.start(station)
      expect {journey.finish(station)}.to change {journey.log.length}.by 1
      journey.start(station)
      expect {journey.finish(station)}.to change {journey.log.length}.by 1
      expect(journey.log.length).to eq 2
    end

    it 'logs if current journey does not exists (touch out twice)' do
      journey = JourneyLog.new(journey_class: Journey)
      journey.finish(station)
      expect {journey.finish(station)}.to change {journey.log.length}.by 1
    end

    it 'logs if current journey does not exists (touch out twice) two' do
      allow(journey).to receive(:finish).with(exit_station: station)
      subject.finish(station)
      expect {subject.finish(station)}.to change {subject.log.length}.by 1
    end
  end

end
