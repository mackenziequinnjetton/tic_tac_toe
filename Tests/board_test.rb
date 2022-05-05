require './board'
require './input_to_string_io'

require 'minitest/autorun'

class BoardTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_board = Board.new
  end

  def test_store_move
    @test_board.store_move(Hash['row' => :rowc, 'col' => move_x])

    exp =

    assert_equal(exp, Board.moves)
  end

  def test_display
    # TODO: Print current board
    skip 'Not implemented'
  end
end
