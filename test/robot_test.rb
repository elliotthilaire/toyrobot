require 'minitest/autorun'
require_relative '../lib/robot'

describe Robot do
  before do
    @toyrobot = ToyRobot.new
  end

  describe "#report" do
    describe "when placed at 0,0, NORTH" do
      it 'reports placement' do
        @toyrobot.place(x: 0, y: 0, direction: 'NORTH')
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
      @toyrobot.place(x: 0, y: 1, direction: 'NORTH')
      @toyrobot.report.must_equal "0,1,NORTH"
    end

    it 'does nothing when placed below x bounds' do
      @toyrobot.place(x: -1, y: 0, direction: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed above x bounds' do
      @toyrobot.place(x: 5, y: 0, direction: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed below y bounds' do
      @toyrobot.place(x: 0, y: -1, direction: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when placed above y bounds' do
      @toyrobot.place(x: 0, y: 5, direction: 'NORTH')
      @toyrobot.report.must_equal nil
    end

    it 'does nothing when supplied with invalid direction' do
      @toyrobot.place(x: 0, y: 0, direction: 'INVALID_DIRECTION')
      @toyrobot.report.must_equal nil
    end
  end

  describe '#move' do
    it 'moves foward NORTH' do
      @toyrobot.place(x: 0, y: 0, direction: 'NORTH')
      @toyrobot.move
      @toyrobot.report.must_equal "0,1,NORTH"
    end

    it 'moves foward EAST' do
      @toyrobot.place(x: 0, y: 0, direction: 'EAST')
      @toyrobot.move
      @toyrobot.report.must_equal "1,0,EAST"
    end

    it 'moves foward SOUTH' do
      @toyrobot.place(x: 4, y: 4, direction: 'SOUTH')
      @toyrobot.move
      @toyrobot.report.must_equal "4,3,SOUTH"
    end

    it 'moves foward WEST' do
      @toyrobot.place(x: 4, y: 4, direction: 'WEST')
      @toyrobot.move
      @toyrobot.report.must_equal "3,4,WEST"
    end

    describe 'when at edge' do
      it 'does not move NORTH' do
        @toyrobot.place(x: 4, y: 4, direction: 'NORTH')
        @toyrobot.move
        @toyrobot.report.must_equal "4,4,NORTH"
      end

      it 'does not move EAST' do
        @toyrobot.place(x: 4, y: 4, direction: 'EAST')
        @toyrobot.move
        @toyrobot.report.must_equal "4,4,EAST"
      end

      it 'does not move SOUTH' do
        @toyrobot.place(x: 0, y: 0, direction: 'SOUTH')
        @toyrobot.move
        @toyrobot.report.must_equal "0,0,SOUTH"
      end

      it 'does not move WEST' do
        @toyrobot.place(x: 0, y: 0, direction: 'WEST')
        @toyrobot.move
        @toyrobot.report.must_equal "0,0,WEST"
      end
    end
  end

  describe '#right' do
    it 'rotates from NORTH to EAST' do
      @toyrobot.place(x: 0, y: 0, direction: 'NORTH')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to SOUTH' do
      @toyrobot.place(x: 0, y: 0, direction: 'EAST')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to WEST' do
      @toyrobot.place(x: 0, y: 0, direction: 'SOUTH')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,WEST"
    end

    it 'rotates from SOUTH to WEST' do
      @toyrobot.place(x: 0, y: 0, direction: 'WEST')
      @toyrobot.right
      @toyrobot.report.must_equal "0,0,NORTH"
    end
  end

  describe '#left' do
    it 'rotates from NORTH to WEST' do
      @toyrobot.place(x: 0, y: 0, direction: 'NORTH')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,WEST"
    end

    it 'rotates from WEST to SOUTH' do
      @toyrobot.place(x: 0, y: 0, direction: 'WEST')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to EAST' do
      @toyrobot.place(x: 0, y: 0, direction: 'SOUTH')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to NORTH' do
      @toyrobot.place(x: 0, y: 0, direction: 'EAST')
      @toyrobot.left
      @toyrobot.report.must_equal "0,0,NORTH"
    end
  end

end

