require 'station'

describe Station do

  # let(:kings_cross) { Station.new(:kings_cross, 1) }
  subject {described_class.new("Kings Cross", 1)}
  # it { is_expected.to respond_to :name }
  # it { is_expected.to respond_to :zone }

  it "station takes two arguments" do
      expect(Station).to respond_to(:new).with(2).arguments
    end

    describe '#name' do
      it 'return the name set at initialize' do
        expect(subject.name).to eq "Kings Cross"
      end
    end

    describe '#zone' do
      it 'return the zone set at initialize' do
        expect(subject.zone).to eq 1
      end
    end

end
