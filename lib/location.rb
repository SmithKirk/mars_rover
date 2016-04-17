class Location

  attr_reader :x, :y, :point

  def initialize(x,y,point,plateau)
    @x = x.to_i
    @y = y.to_i
    @point = point
    @plateau = plateau
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

  def move
    case @point
      when 'N' then @y += 1
      when 'S' then @y -= 1
      when 'E' then @x += 1
      when 'W' then @x -= 1
    end
  end




end
