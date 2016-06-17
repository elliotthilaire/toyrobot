require 'minitest/autorun'
require './toyrobot'

# Feature tests writtin from README.md

describe ToyRobot do
  before do
    @toyrobot = ToyRobot.new
  end

  describe "first example" do
    it "must work" do
      sequence = "PLACE 0,0,NORTH MOVE REPORT"
      @toyrobot.run(sequence).must_equal "0,1,NORTH"
    end
  end

  describe "second example" do
    it "must work" do
      sequence = "PLACE 0,0,NORTH LEFT REPORT"
      @toyrobot.run(sequence).must_equal "0,0,WEST"
    end

  describe "third example" do
    it "must work" do
      sequence = "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT"
      @toyrobot.run(sequence).must_equal "0,0,WEST"
    end
  end
end

