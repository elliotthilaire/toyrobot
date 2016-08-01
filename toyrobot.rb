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
    self
  end

  def report
    return unless validate_position

    "#{@x},#{@y},#{@facing}"
  end

  def move
    return unless validate_position

    case @facing
    when 'NORTH'
      @y = [(@y + 1), 4].min
    when 'EAST'
      @x = [(@x + 1), 4].min
    when 'SOUTH'
      @y = [(@y - 1), 0].max
    when 'WEST'
      @x = [(@x - 1), 0].max
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
    @x && @y && @facing
  end

end
