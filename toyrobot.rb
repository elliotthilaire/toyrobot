
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
    return unless @x && @y && @facing

    "#{@x},#{@y},#{@facing}"
  end

  def move
    fail NotImplementedError
  end

  def left
    fail NotImplementedError
  end

  def right
    fail NotImplementedError
  end

private

end
