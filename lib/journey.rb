class Journey

  PENALTY_FARE = 6

  attr_reader :journey, :entry_station, :exit_station

  def initialize(entry_station)
    @journey = {}
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    !! @exit_station
  end

  def fare
    PENALTY_FARE
  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

end
