class Journey
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
