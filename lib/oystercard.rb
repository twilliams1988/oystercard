class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :journeys

  def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
      @journeys = {}
  end
  def top_up(amount)
      fail "Card limited to £90" if (@balance+amount)>MAXIMUM_BALANCE
      @balance += amount
      @balance
  end

  def touch_in(station)
    fail 'Insufficient balance' if @balance < MINIMUM_FARE
    @journeys[:entry_station] = station
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys[:exit_station] = station
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
