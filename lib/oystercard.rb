class OysterCard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Top-up exceeds £#{MAX_LIMIT} max card limit" if balance + amount > MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Your balance £#{balance} does not meet min fare" if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
