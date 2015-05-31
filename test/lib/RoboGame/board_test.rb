require_relative '../../test_helper'

describe Board do

  def setup
    @board = Board.new(5)
  end

  it "#field_available?" do
    @board.field_available?(0,0).must_equal true
    @board.field_available?(4,4).must_equal true
    @board.field_available?(5,0).must_equal false
    @board.field_available?(0,5).must_equal false
    @board.field_available?(-1,0).must_equal false
    @board.field_available?(0,-1).must_equal false
  end

end