require 'minitest/autorun'
require './toyrobot'

describe ToyRobot do
  before do
    @toyrobot = ToyRobot.new
  end

  describe "#report" do
    describe "when placed at 0,0, NORTH" do
      it 'reports placement' do
        @toyrobot.place(x: 0, y: 0, facing: 'NORTH')
        @toyrobot.report.must_equal "0,0,NORTH"
      end
    end

    describe "when not placed" do
      it 'returns with nothing' do
        @toyrobot.report.must_equal nil
      end
    end
  end

  describe "#place" do
    it "can be placed at 0,1,NORTH" do
      @toyrobot.place(x: 0, y: 1, facing: 'NORTH')
      @toyrobot.report.must_equal "0,1,NORTH"
    end

    it 'does nothing when placed below x bounds' do
      @toyrobot.place(x: -1, y: 0, facing: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed above x bounds' do
      @toyrobot.place(x: 5, y: 0, facing: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed below y bounds' do
      @toyrobot.place(x: 0, y: -1, facing: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed above y bounds' do
      @toyrobot.place(x: 0, y: 5, facing: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when supplied with invalid direction' do
      @toyrobot.place(x: 0, y: 0, facing: 'INVALID_DIRECTION')
      @toyrobot.report.must_equal nil
    end
  end

  describe '#move' do
    it 'moves foward' do
      @toyrobot.place(x: 0, y: 0, facing: 'NORTH')
      @toyrobot.move
      @toyrobot.report.must_equal "0,1,NORTH"
    end
  end

end

