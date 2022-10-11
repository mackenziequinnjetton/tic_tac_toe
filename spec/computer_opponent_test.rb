require 'board'
require 'computer_opponent'

require 'minitest/autorun'

class ComputerOpponentTest < Minitest::Test
  def setup
    @test_comp_player = ComputerOpponent.new
  end

  def test_get_move_empty_board
    current_player_number = 2
    board = Board.new

    exp = { row: :row1, col: :col_a= }
    act = @test_comp_player.get_move(current_player_number:, board:)

    assert_equal(exp, act)
  end

  def test_get_move_a1_taken
    current_player_number = 1
    board = Board.new(row1: BoardRow.new(col_a: 'X'))

    exp = { row: :row1, col: :col_b= }
    act = @test_comp_player.get_move(current_player_number:, board:)

    assert_equal(exp, act)
  end

  def test_get_move_through_c1_taken
    current_player_number = 2
    board = Board.new(row1:
      BoardRow.new(col_a: 'X', col_b: 'X', col_c: 'X'))

    exp = { row: :row2, col: :col_a= }
    act = @test_comp_player.get_move(current_player_number:, board:)

    assert_equal(exp, act)
  end
end
