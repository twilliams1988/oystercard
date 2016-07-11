require 'oystercard'

describe 'feature test' do

it 'allows oystercard usage' do
  card = OysterCard.new
  card.top_up(5)
end

end
