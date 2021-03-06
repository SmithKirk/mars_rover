class Rover

  attr_reader :position

  def initialize(plateau, position)
    x,y,d = position.split(" ")
    @position = {
      x: x.to_i,
      y: y.to_i,
      direction: d
    }
    @plateau = Plateau.new(plateau)
  end

  def status
    "#{@position[:x]} #{@position[:y]} #{@position[:direction]}"
  end

  def explore_sequence(sequence)
    sequence.split("").each{|command| action(command)}
    status
  end

  def action(command)
    case command
      when 'M' then move
      when 'L' then turn_left
      when 'R' then turn_right
    end
  end

  def turn_left
    @position[:direction] = case @position[:direction]
      when 'N' then 'W'
      when 'W' then 'S'
      when 'S' then 'E'
      when 'E' then 'N'
    end
  end

  def turn_right
    @position[:direction] = case @position[:direction]
      when 'N' then 'E'
      when 'E' then 'S'
      when 'S' then 'W'
      when 'W' then 'N'
    end
  end

  def move
    x,y = case @position[:direction]
      when 'N' then [0,1] unless cannot_move?
      when 'S' then [0,-1] unless cannot_move?
      when 'E' then [1,0] unless cannot_move?
      when 'W' then [-1,0] unless cannot_move?
    end

    @position[:x] += x.to_i
    @position[:y] += y.to_i
  end

  private
  def cannot_move?
    at_north_limit? && @position[:direction] == 'N' ||
    at_south_limit? && @position[:direction] == 'S' ||
    at_east_limit? && @position[:direction] == 'E' ||
    at_west_limit? && @position[:direction] == 'W'
  end

  def at_north_limit?
    @position[:y] == @plateau.north_limit
  end

  def at_south_limit?
    @position[:y] == @plateau.south_limit
  end

  def at_east_limit?
    @position[:x] == @plateau.east_limit
  end

  def at_west_limit?
    @position[:x] == @plateau.west_limit
  end

end
