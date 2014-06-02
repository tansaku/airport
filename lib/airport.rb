require 'debugger'

class Airport
  ARRAY = [:stormy,:stormy,:stormy,:sunny,:sunny,:sunny,:sunny,:sunny,:sunny,:sunny]
  def initialize
    @capacity = 5
    @planes = []
    @weather = :sunny
  end
  def weather
    @weather = ARRAY.sample
    @weather
  end
  def land(plane)
    return "Unable to land plane" if full? or stormy?
    plane.land
    @planes << plane
  end
  def takeoff(plane)
    return "Unable to take off" if unable_to_takeoff?
    plane.takeoff
    @planes.delete plane
  end
  def full?
    if @planes.count >= 5
      @planes.each {|p| p.takeoff}
      return true
    end
    false
  end
  def stormy?
    self.weather == :stormy
  end
  def unable_to_takeoff?
    stormy?
  end
end