
class ToyRobot
  def initialize
    @location = nil
    @facing = nil
  end

  def place(x:, y:, facing:)
    @location = [x,y]
    @facing = facing
  end

  def report
    "0,0,NORTH"
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
