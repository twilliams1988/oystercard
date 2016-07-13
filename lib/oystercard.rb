require_relative 'journey'
require_relative 'station'

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :journey, :current_journey

  def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
      @current_journey = nil
  end

  def top_up(amount)
      fail "Card limited to £90" if (@balance+amount)>MAXIMUM_BALANCE
      @balance += amount
  end

  def touch_in(station)
    deduct(Journey::PENALTY_FARE) if @entry_station
    fail 'Insufficient balance' if @balance < MINIMUM_FARE
    @entry_station = station
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey = Journey.new if @current_journey.nil?
    @current_journey.finish(station)
    @entry_station = nil
    deduct(@current_journey.fare)
  end

  def in_journey?
    !!@entry_station
  end

private

  def deduct(amount)
      @balance -= amount
  end
end
