require_relative "lib/position"

class ToyRobot

  VALID_DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
  end

  def place(x:, y:, facing:)
    return unless x.between?(0,4)
    return unless y.between?(0,4)
    return unless VALID_DIRECTIONS.include? facing

    @facing = facing
    @position = Position.new(x: x, y: y)
    self
  end

  def report
    return unless validate_position

    "#{@position.x},#{@position.y},#{@facing}"
  end

  def move
    case @facing
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
    self
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
      x, y, f = args.split(",")
      place(x: Integer(x), y: Integer(y), facing: f)
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
    @position && @facing
  end

end
