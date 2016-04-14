class Rover

  attr_reader :location

  def initialize(x,y,direction)
    @location = Location.new(x,y,direction)
  end
end
