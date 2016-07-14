class OysterCard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
    @journey = {}

  end

  def top_up(amount)
    fail "Top-up exceeds £#{MAX_LIMIT} max card limit" if balance + amount > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    !@journey.empty?
  end

  def touch_in(entry_station)
    fail "Your balance does not meet min fare" if balance < MIN_FARE
    @journey_history << @journey if @journey.has_key? :entry_station
    @journey = {}
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @journey[:exit_station] = exit_station
    @journey_history << @journey
    @journey = {}
  end

  def get_history
    @journeys
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
