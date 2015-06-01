require_relative '../../test_helper'

describe Robot do

  def setup
    @board = Board.new(5)
    @robot = Robot.new(@board)
    @starting_position = [0, 0, :north]
    @robot.place *@starting_position
  end

  describe "accepts command" do

    it "report" do
      @robot.report.must_equal @starting_position
    end

    it "move" do
      @robot
        .move
        .report.must_equal [0, 1, :north]
    end

    it "left" do
      @robot.left.report.must_equal [0, 0, :west]
      @robot.left.report.must_equal [0, 0, :south]
      @robot.left.report.must_equal [0, 0, :east]
      @robot.left.report.must_equal [0, 0, :north]
    end

    it "right" do
      @robot.right.report.must_equal [0, 0, :east]
      @robot.right.report.must_equal [0, 0, :south]
      @robot.right.report.must_equal [0, 0, :west]
      @robot.right.report.must_equal [0, 0, :north]
    end

    it "place" do
      @robot
        .place(1, 1, :east)
        .report.must_equal [1, 1, :east]

      @robot
        .place("1", "2", "west")
        .report.must_equal [1, 2, :west]
    end

  end

  describe "is rock solid" do

    it "won't fall" do
      @robot
        .left
        .forward
        .report.must_equal [0, 0, :west]
    end

    it 'won\'t accept invalid coordinates' do
      @robot
        .place(-1, -1, :north)
        .report.must_equal @starting_position
      @robot
        .place('t', 0, :north)
        .report.must_equal @starting_position
      @robot
      .place(0.9, 0, :north)
      .report.must_equal @starting_position

      @robot
      .place(nil, 0, :north)
      .report.must_equal @starting_position
    end

    it 'won\'t accept invalid heading' do
      @robot.place 1, 1, :northeast
      @robot.report[0..1].must_equal [0, 0]
      @robot.report.last.must_equal :north
    end

    it 'still works after invalid command' do
      @robot.place( -1, 0, :east)
        .forward
        .left
        .forward
        .right
        .right
        .forward
        .report.must_equal [1,1,:east]
    end

  end

end