class Rover

  attr_reader :location

  def initialize(plateau,location)
    x,y,point = location.split(" ")
    @location = Location.new(x,y,point,plateau)
  end


end
