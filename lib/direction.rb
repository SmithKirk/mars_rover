class Direction

  attr_reader :point

  def initialize(point)
    @point = point
  end

  def turn_left
    case @point
    when 'N' then @point = 'W'
    when 'W' then @point = 'S'
    when 'S' then @point = 'E'
    when 'E' then @point = 'N'
    end
  end

  def turn_right
    case @point
    when 'N' then @point = 'E'
    when 'E' then @point = 'S'
    when 'S' then @point = 'W'
    when 'W' then @point = 'N'
    end
  end

  def north?
    @point == 'N'
  end

end
