
class ToyRobot

  VALID_DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
  end

  def place(x:, y:, facing:)
    return unless x.between?(0,4)
    return unless y.between?(0,4)
    return unless VALID_DIRECTIONS.include? facing

    @x = x
    @y = y
    @facing = facing
  end

  def report
    return unless validate_position

    "#{@x},#{@y},#{@facing}"
  end

  def move
    return unless validate_position

    @y += 1
  end

  def left
    case @facing
    when 'NORTH'
      @facing = 'WEST'
    when 'WEST'
      @facing = 'SOUTH'
    when 'SOUTH'
      @facing = 'EAST'
    when 'EAST'
      @facing = 'NORTH'
    end
  end

  def right
    case @facing
    when 'NORTH'
      @facing = 'EAST'
    when 'EAST'
      @facing = 'SOUTH'
    when 'SOUTH'
      @facing = 'WEST'
    when 'WEST'
      @facing = 'NORTH'
    end
  end

private

  def validate_position
    @x && @y && @facing
  end

end
