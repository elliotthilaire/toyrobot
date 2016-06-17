require 'minitest/autorun'
require './toyrobot'

describe ToyRobot do
  before do
    @toyrobot = ToyRobot.new
  end

  describe "#report" do
    it 'reports placement when at 0,0, NORTH' do
      @toyrobot.place(x: 0, y: 0, facing: 'NORTH')
      @toyrobot.report.must_equal "0,0,NORTH"
    end
  end

  describe "#place" do
    it "can be placed at 0,1,NORTH" do
      @toyrobot.place(x: 0, y: 1, facing: 'NORTH')
      @toyrobot.report.must_equal "0,1,NORTH"
    end
  end

end

