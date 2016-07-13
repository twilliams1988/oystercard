require_relative 'journey'
require_relative 'station'

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :balance, :entry_station, :journey

  def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
      @journey = Journey.new
  end

  def top_up(amount)
      fail "Card limited to £90" if (@balance+amount)>MAXIMUM_BALANCE
      @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient balance' if @balance < MINIMUM_FARE
    deduct(PENALTY_FARE) if in_journey?
    @journey.add_entry(station)
    @entry_station = station
  end

  def touch_out(station)
    fare
    @journey.add_exit(station)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  def fare
    in_journey? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
  end

private

  def deduct(amount)
      @balance -= amount
  end
end
