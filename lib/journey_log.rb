require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :log

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @log = []

  end

  def start(station)
    log_journey if @current_journey
    @current_journey = @journey_class.new(entry_station: station)
  end

  def finish(station)
    @current_journey = @journey_class.new if !@current_journey
    @current_journey.finish(exit_station: station)
    log_journey
  end

private

def current_journey
  @current_journey || @journey_class.new
end

def log_journey
  @log << @current_journey
  @current_journey = nil
end

end
