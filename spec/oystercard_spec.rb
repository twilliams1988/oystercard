require 'oystercard'

describe Oystercard do
    
    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
describe '#top_up' do
   it 'tells you when you top up' do 
       #expect(subject.top_up(1)).to eq 1 ======= Our code
       expect{subject.top_up(1)}.to change{subject.balance}.by(1)
      end
   end
   
   it 'tells you there is a £90 limit' do
       maximum_balance = Oystercard::MAXIMUM_BALANCE
       card = Oystercard.new(maximum_balance)
       expect{card.top_up(maximum_balance)}.to raise_error "card limitted to £#{maximum_balance}"
   end



end


