
class ToyRobot
  def initialize
  end

  def place(x:, y:, facing:)
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
end
