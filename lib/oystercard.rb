require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class OysterCard

  MAX_LIMIT = 90

  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @log = JourneyLog.new

  end

  def top_up(amount)
    fail "Top-up exceeds £#{MAX_LIMIT} max card limit" if balance + amount > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    !@journey.empty?
  end

  def touch_in(entry_station)
    fail "Your balance does not meet min fare" if balance < Journey::MIN_FARE
    deduct(@journey.fare) if !@journey.empty?
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey = Journey.new if @journey.nil?
    @journey.finish(exit_station)
    deduct(@journey.fare)
    @journey = nil
  end

  def get_history
    @journeys
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
