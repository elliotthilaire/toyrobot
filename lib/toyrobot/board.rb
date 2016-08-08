
module ToyRobot
  class Board
    def initialize(x_size: 5, y_size: 5)
      @x_range = (0...Integer(x_size))
      @y_range = (0...Integer(y_size))
    end

    def safe?(x:, y:)
      @x_range.include?(x) && @y_range.include?(y)
    end

    def hazard?(x:, y:)
      !safe?(x:x, y:y)
    end
  end
end

# 04 14 24 34 44
# 03 13 23 33 43
# 02 12 22 32 42
# 01 11 21 31 41
# 00 10 20 30 40
