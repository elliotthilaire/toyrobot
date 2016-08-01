
require 'minitest/autorun'
require './toyrobot'

# Acceptance tests written from README.md

describe ToyRobot do
  before do
    @toyrobot = ToyRobot.new
  end

  describe "when command before PLACE" do
    it "ignores previous commands" do
      sequence = <<~EOF
        MOVE
        PLACE 0,0,NORTH
        MOVE
        REPORT
      EOF

      @toyrobot.run(sequence).must_equal "0,1,NORTH"
    end
  end

  describe "when no report command" do
    it "does not return anything" do
      sequence = <<~EOF
        PLACE 0,0,NORTH
      EOF

      @toyrobot.run(sequence).must_equal nil
    end
  end

  describe "when placing outside of the bounds" do
    it "ignores the invalid command" do
      sequence = <<~EOF
        PLACE 16,16,EAST
        REPORT
      EOF

      @toyrobot.run(sequence).must_equal nil
    end
  end
end
