module ToyRobot
  class Direction
    attr_reader :direction

    VALID_DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

    def initialize(direction:)
      fail ArgumentError unless VALID_DIRECTIONS.include? direction
      @direction = direction
    end

    def left
      case @direction
      when 'NORTH'
        @direction = 'WEST'
      when 'WEST'
        @direction = 'SOUTH'
      when 'SOUTH'
        @direction = 'EAST'
      when 'EAST'
        @direction = 'NORTH'
      end
      self
    end

    def right
      case @direction
      when 'NORTH'
        @direction = 'EAST'
      when 'EAST'
        @direction = 'SOUTH'
      when 'SOUTH'
        @direction = 'WEST'
      when 'WEST'
        @direction = 'NORTH'
      end
      self
    end
  end
end
