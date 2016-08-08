require 'minitest/autorun'
require_relative '../lib/toyrobot/robot'

describe ToyRobot::Robot do
  before do
    @robot = ToyRobot::Robot.new
  end

  describe "#report" do
    describe "when placed at 0,0, NORTH" do
      it 'reports placement' do
        @robot.place(x: 0, y: 0, direction: 'NORTH')
        @robot.report.must_equal "0,0,NORTH"
      end
    end

    describe "when not placed" do
      it 'returns with nothing' do
        @robot.report.must_equal nil
      end
    end
  end

  describe "#place" do
    it "can be placed at 0,1,NORTH" do
      @robot.place(x: 0, y: 1, direction: 'NORTH')
      @robot.report.must_equal "0,1,NORTH"
    end

    it 'does nothing when placed below x bounds' do
      @robot.place(x: -1, y: 0, direction: 'NORTH')
      @robot.report.must_equal nil
    end

    it 'does nothing when placed above x bounds' do
      @robot.place(x: 5, y: 0, direction: 'NORTH')
      @robot.report.must_equal nil
    end

    it 'does nothing when placed below y bounds' do
      @robot.place(x: 0, y: -1, direction: 'NORTH')
      @robot.report.must_equal nil
    end

    it 'does nothing when placed above y bounds' do
      @robot.place(x: 0, y: 5, direction: 'NORTH')
      @robot.report.must_equal nil
    end

    it 'does nothing when supplied with invalid direction' do
      @robot.place(x: 0, y: 0, direction: 'INVALID_DIRECTION')
      @robot.report.must_equal nil
    end
  end

  describe '#move' do
    it 'moves foward NORTH' do
      @robot.place(x: 0, y: 0, direction: 'NORTH')
      @robot.move
      @robot.report.must_equal "0,1,NORTH"
    end

    it 'moves foward EAST' do
      @robot.place(x: 0, y: 0, direction: 'EAST')
      @robot.move
      @robot.report.must_equal "1,0,EAST"
    end

    it 'moves foward SOUTH' do
      @robot.place(x: 4, y: 4, direction: 'SOUTH')
      @robot.move
      @robot.report.must_equal "4,3,SOUTH"
    end

    it 'moves foward WEST' do
      @robot.place(x: 4, y: 4, direction: 'WEST')
      @robot.move
      @robot.report.must_equal "3,4,WEST"
    end

    describe 'when at edge' do
      it 'does not move NORTH' do
        @robot.place(x: 4, y: 4, direction: 'NORTH')
        @robot.move
        @robot.report.must_equal "4,4,NORTH"
      end

      it 'does not move EAST' do
        @robot.place(x: 4, y: 4, direction: 'EAST')
        @robot.move
        @robot.report.must_equal "4,4,EAST"
      end

      it 'does not move SOUTH' do
        @robot.place(x: 0, y: 0, direction: 'SOUTH')
        @robot.move
        @robot.report.must_equal "0,0,SOUTH"
      end

      it 'does not move WEST' do
        @robot.place(x: 0, y: 0, direction: 'WEST')
        @robot.move
        @robot.report.must_equal "0,0,WEST"
      end
    end
  end

  describe '#right' do
    it 'rotates from NORTH to EAST' do
      @robot.place(x: 0, y: 0, direction: 'NORTH')
      @robot.right
      @robot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to SOUTH' do
      @robot.place(x: 0, y: 0, direction: 'EAST')
      @robot.right
      @robot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to WEST' do
      @robot.place(x: 0, y: 0, direction: 'SOUTH')
      @robot.right
      @robot.report.must_equal "0,0,WEST"
    end

    it 'rotates from SOUTH to WEST' do
      @robot.place(x: 0, y: 0, direction: 'WEST')
      @robot.right
      @robot.report.must_equal "0,0,NORTH"
    end
  end

  describe '#left' do
    it 'rotates from NORTH to WEST' do
      @robot.place(x: 0, y: 0, direction: 'NORTH')
      @robot.left
      @robot.report.must_equal "0,0,WEST"
    end

    it 'rotates from WEST to SOUTH' do
      @robot.place(x: 0, y: 0, direction: 'WEST')
      @robot.left
      @robot.report.must_equal "0,0,SOUTH"
    end

    it 'rotates from SOUTH to EAST' do
      @robot.place(x: 0, y: 0, direction: 'SOUTH')
      @robot.left
      @robot.report.must_equal "0,0,EAST"
    end

    it 'rotates from EAST to NORTH' do
      @robot.place(x: 0, y: 0, direction: 'EAST')
      @robot.left
      @robot.report.must_equal "0,0,NORTH"
    end
  end

end

