
class ToyRobot
  def initialize
    @x = nil
    @y = nil
    @facing = nil
  end

  def place(x:, y:, facing:)
    @x = x
    @y = y
    @facing = facing
  end

  def report
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
