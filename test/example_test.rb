require 'minitest/autorun'
require_relative '../lib/toyrobot/robot'

# Acceptance tests written from README.md

describe ToyRobot::Robot do
  before do
    @toyrobot = ToyRobot::Robot.new
  end

  describe "first example" do
    it "must work" do
      sequence = <<~EOF
        PLACE 0,0,NORTH
        MOVE
        REPORT
      EOF

      @toyrobot.run(sequence).must_equal "0,1,NORTH"
    end
  end

  describe "second example" do
    it "must work" do
      sequence = <<~EOF
        PLACE 0,0,NORTH
        LEFT
        REPORT
      EOF

      @toyrobot.run(sequence).must_equal "0,0,WEST"
    end
  end

  describe "third example" do
    it "must work" do
      sequence = <<~EOF
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
      EOF

      @toyrobot.run(sequence).must_equal "3,3,NORTH"
    end
  end
end
