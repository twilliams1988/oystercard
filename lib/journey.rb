class Journey
PENALTY_FARE = 6
MINIMUM_FARE = 1
attr_reader :entry_station, :exit_station

  def initialize(station = nil)
    @entry_station = station
  end

  def complete?
    !! @exit_station
  end

  def fare
    ! @exit_station ? PENALTY_FARE : MINIMUM_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end


end































=begin
  attr_reader :journeys, :journeyhistory

  def initialize
    @journeyhistory = []
    @journeys = {}
    @fare = 0
  end

  def add_entry(station)
   @journeyhistory.push(@journeys) if @journeys.length < 2
   @journeys = {}
   @journeys[:entry_station] = station
  end

  def add_exit(station)
    @journeys[:exit_station] = station
    @journeyhistory.push(@journeys)
    @journeys = {}
  end

  def fare
    @fare = Oystercard::MINIMUM_FARE
  end

end
=end
