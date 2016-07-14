require 'Station'

describe Station do

  subject { described_class.new(name: "Brixton", zone: 2)}

  describe "#initialize" do
    it "returns a station name" do
      expect(subject.name).to eq("Brixton")
    end
    it "returns its zone" do
      expect(subject.zone).to eq(2)
    end
  end
end
