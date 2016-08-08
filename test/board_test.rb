require 'minitest/autorun'
require_relative '../lib/toyrobot/board'

describe ToyRobot::Board do

  describe "defaults" do
    describe "#safe?" do
      describe "0,0" do
        it "is safe" do
          board = Board.new
          board.safe?(x:0, y:0).must_equal true
        end
      end

      describe "4,4" do
        it "is safe" do
          board = Board.new
          board.safe?(x:4, y:4).must_equal true
        end
      end

      describe "5,5" do
        it "is not safe" do
          board = Board.new
          board.safe?(x:5, y:5).must_equal false
        end
      end

      describe "-1,-1" do
        it "is not safe" do
          board = Board.new
          board.safe?(x:-1, y:-1).must_equal false
        end
      end

    end
  end
end
