class Rover

  attr_reader :location

  def initialize(x,y,point)
    @location = Location.new(x,y,point)
  end


end
