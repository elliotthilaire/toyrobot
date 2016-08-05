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
    return unless placed?
    "#{@position.x},#{@position.y},#{@direction.direction}"
  end

  def move
    return unless placed?

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
    return unless placed?

    @direction.left
    self
  end

  def right
    return unless placed?

    @direction.right
    self
  end

  def run(sequence)
    commands = sequence.split("\n")

    commands.collect do |command_string|
      interpret(command_string)
    end.last
  end

  def interpret(command_string)
    command, args = command_string.split(" ")

    case command
    when "PLACE"
      return unless args
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

  def placed?
    @position && @direction
  end
end
