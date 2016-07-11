class OysterCard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @in_journey = false

  end

  def top_up(amount)
    fail "Top-up exceeds £#{MAX_LIMIT} max card limit" if balance + amount > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "Your balance £#{balance} does not meet min fare" if balance < MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
