require 'board'
require 'computer_opponent'

require 'minitest/autorun'

class ComputerOpponentTest < Minitest::Test
  def setup
    @test_comp_player = ComputerOpponent.new
  end

  def test_get_move_empty_board
    exp = { row: :row1, col: :col_a }
    act = @test_comp_player.get_move(board: Board.new)

    assert_equal(exp, act)
  end

  def test_get_move_a1_taken
    exp = { row: :row1, col: :col_b }
    act = @test_comp_player.get_move(board: Board.new(row1: BoardRow.new(col_a: 'X')))

    assert_equal(exp, act)
  end

  def test_get_move_through_c1_taken
    exp = { row: :row2, col: :col_a }
    act = @test_comp_player.get_move(board: Board.new(row1:
      BoardRow.new(col_a: 'X', col_b: 'X', col_c: 'X')))

    assert_equal(exp, act)
  end

  def test_incomplete_message
    exp = 'We\'re sorry, computer player support is not fully implemented yet. ' \
          'Please try again later!'
    act = @test_comp_player.incomplete_message

    assert_equal(exp, act)
  end
end
