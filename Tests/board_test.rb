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

  def display_exp
    "   a     b     c\n" \
    "      |     |\n" \
    "1  -  |  X  |  -\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  -  |  -  |  -\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  O  |  -  |  -\n" \
    "      |     |\n"
  end

  def test_display
    @test_board.store_move(
      hash: Hash[row: :row1, col: :col_b=],
      current_player: 1
    )

    @test_board.store_move(
      hash: Hash[row: :row3, col: :col_a=],
      current_player: 2
    )

    assert_equal(display_exp, @test_board.display)
  end
end
