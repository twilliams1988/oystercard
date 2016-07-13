class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :entry_station
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
  end
  def top_up(amount)
      fail "Card limited to £90" if (@balance+amount)>MAXIMUM_BALANCE
      @balance += amount
      @balance
  end

  def touch_in(station)
    fail 'Insufficient balance' if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !! @entry_station
  end

private
  def deduct(amount)
      @balance -= amount
      @balance
  end
end
