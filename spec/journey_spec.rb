require 'journey'

describe Journey do

let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
subject { described_class.new(entry_station) }

describe '#initialize' do
  it 'starts the journey with an empty journey hash' do
    expect(subject.journey).to be_empty
  end

  it 'sets @entry_station to the argument passed' do
    expect(subject.entry_station).to eq entry_station
  end
end

describe '#complete?' do
  it 'checks if there is an exit station' do
    expect(subject).not_to be_complete
  end
end

describe '#fare' do
  it 'charges a penalty fare by default' do
    expect(subject.fare).to eq 6
  end
end

describe '#finish' do
  it 'sets @exit_station to the argument passed' do
    expect(subject.finish(exit_station)).to eq subject.exit_station
  end

context 'given an exit_station' do
  before do
    subject.finish(exit_station)
  end

  it 'calculates the journey fare' do
    expect(subject.fare).to eq 1
  end
end

end



end
