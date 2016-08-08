
module ToyRobot
  class CLI
    def self.start(args)
      if args[0]
        run_from_file(args[0])
      else
        start_console
      end
    end

    def self.run_from_file(filepath)
      robot = Robot.new

      file = IO.read(filepath)
      robot.run(file)
    end

    def self.start_console
      robot = Robot.new

      puts "Enter commands; EXIT to quit:"
      while
        command = gets.chomp
        break if command == "EXIT"
        robot.run(command)
      end
    end
  end
end
