require './board'
require './input_to_string_io'

require 'minitest/autorun'

class BoardTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_board = Board.new
  end

  def test_store_move
    @test_board.store_move(
      hash: Hash[row: :row2, col: :col_c=],
      current_player: 1
    )

    exp = Board.new(row2: BoardRow.new(col_c: 'X')).row2.col_c

    assert_equal(exp, @test_board.row2.col_c)
  end

  def test_display
    # TODO: Print current board
    skip 'Not implemented'
  end
end
