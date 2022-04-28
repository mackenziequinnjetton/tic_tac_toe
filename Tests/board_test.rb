require './board'

require 'minitest/autorun'

class BoardTest < Minitest::Test
  def setup
    @test_board = Board.new
  end

  def teardown
    @test_board = nil
  end

  def test_update
    # TODO: Check that board is updated correctly
    skip 'Not implemented'
  end

  def test_display
    # TODO: Print current board
    skip 'Not implemented'
  end
end
