class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1


  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    !! @exit_station && @entry_station
  end

  def fare
    self.complete? ? MIN_FARE : PENALTY_FARE
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

end
