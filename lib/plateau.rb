class Plateau

  attr_reader :east_limit, :north_limit, :west_limit, :south_limit

  def initialize(area)
    x, y = area.split(" ")
    @east_limit = x.to_i
    @north_limit = y.to_i
    @west_limit = 0
    @south_limit = 0
  end
end
