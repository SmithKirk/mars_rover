class Direction

  attr_reader :point

  def initialize(point)
    @point = point
  end

  def turn_left
    case
    when @point == 'N'
      @point = 'W'
    when @point == 'W'
      @point = 'S'
    when @point == 'S'
      @point = 'E'
    when @point == 'E'
      @point = 'N'
    end
  end

  def turn_right
    case
    when @point == 'N'
      @point = 'E'
    when @point == 'E'
      @point = 'S'
    when @point == 'S'
      @point = 'W'
    when @point == 'W'
      @point = 'N'
    end

  end

end
