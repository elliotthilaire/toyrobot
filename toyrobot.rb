require_relative "lib/position"
require_relative "lib/direction"

class ToyRobot

  def initialize
  end

  def place(x:, y:, direction:)
    @direction = Direction.new(direction: direction)
    @position = Position.new(x: x, y: y)
    self
  rescue ArgumentError
    return
  end

  def report
    return unless validate_position
    "#{@position.x},#{@position.y},#{@direction.direction}"
  end

  def move
    case @direction.direction
    when 'NORTH'
      @position.move_north
    when 'EAST'
      @position.move_east
    when 'SOUTH'
      @position.move_south
    when 'WEST'
      @position.move_west
    end
    self
  end

  def left
    @direction.left
    self
  end

  def right
    @direction.right
    self
  end

  def run(sequence)
    commands = sequence.split("\n")

    commands.collect do |string|
      parse(string)
    end.last
  end

  def parse(string)
    command, args = string.split(" ")

    case command
    when "PLACE"
      x, y, direction = args.split(",")
      place(x: Integer(x), y: Integer(y), direction: direction)
    when "MOVE"
      move
    when "LEFT"
      left
    when "RIGHT"
      right
    when "REPORT"
      report
    end
  end

private

  def validate_position
    @position && @direction
  end

end
