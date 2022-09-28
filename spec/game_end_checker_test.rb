require 'board'
require 'game_end_checker'

require 'minitest/autorun'

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
    @test_board = Board.new
  end

  def test_check_game_end_winner_p1
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_c = 'O'
    @test_board.row2.col_a = 'X'
    @test_board.row2.col_b = 'O'
    @test_board.row3.col_a = 'X'

    assert_equal(:winner_p1, @test_game_end_checker.check_game_end(board: @test_board, current_player: 1))
  end

  def test_check_game_end_winner_p2
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_c = 'O'
    @test_board.row2.col_a = 'X'
    @test_board.row3.col_a = 'O'
    @test_board.row3.col_c = 'X'
    @test_board.row2.col_b = 'O'

    assert_equal(:winner_p2, @test_game_end_checker.check_game_end(board: @test_board, current_player: 2))
  end

  def test_check_game_end_draw
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_b = 'O'
    @test_board.row1.col_c = 'X'
    @test_board.row2.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row2.col_c = 'O'
    @test_board.row3.col_a = 'O'
    @test_board.row3.col_b = 'X'
    @test_board.row3.col_c = 'O'

    assert_equal(:draw, @test_game_end_checker.check_game_end(board: @test_board, current_player: 1))
  end

  def test_check_game_end_none
    @test_board.row1.col_b = 'X'
    @test_board.row2.col_a = 'O'
    @test_board.row2.col_b = 'O'
    @test_board.row2.col_c = 'X'
    @test_board.row3.col_b = 'O'

    assert_nil(@test_game_end_checker.check_game_end(board: @test_board, current_player: 2))
  end
end
