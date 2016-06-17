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

  describe '#right' do
    it 'rotates from NORTH to EAST' do
      @toyrobot.place(x: 0, y: 0, facing: 'NORTH')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to SOUTH' do
      @toyrobot.place(x: 0, y: 0, facing: 'EAST')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to WEST' do
      @toyrobot.place(x: 0, y: 0, facing: 'SOUTH')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,WEST"
    end

    it 'rotates from SOUTH to WEST' do
      @toyrobot.place(x: 0, y: 0, facing: 'WEST')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,NORTH"
    end
  end

  describe '#left' do
    it 'rotates from NORTH to WEST' do
      @toyrobot.place(x: 0, y: 0, facing: 'NORTH')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,WEST"
    end

    it 'rotates from WEST to SOUTH' do
      @toyrobot.place(x: 0, y: 0, facing: 'WEST')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to EAST' do
      @toyrobot.place(x: 0, y: 0, facing: 'SOUTH')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to NORTH' do
      @toyrobot.place(x: 0, y: 0, facing: 'EAST')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,NORTH"
    end
  end

end

