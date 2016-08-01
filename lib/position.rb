class Position

  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def move_north
    @y = [(@y + 1), 4].min
    self
  end

  def move_south
    @y = [(@y - 1), 0].max
    self
  end

  def move_east
    @x = [(@x + 1), 4].min
    self
  end

  def move_west
    @x = [(@x - 1), 0].max
    self
  end
end
