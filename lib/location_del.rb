require_relative 'direction'

class Location

  attr_reader :x, :y

  def initialize(x,y, point: Direction.new(point))
    @x = x.to_i
    @y = y.to_i
    @direction = point
  end

  def move
    @y += 1 if @direction.point == 'N'


  end
end
