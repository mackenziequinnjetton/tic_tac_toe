require './board'
require './game_end_checker'

require 'minitest/autorun'

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
    @test_board = Board.new
  end

  def test_winner_true
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_c = 'O'
    @test_board.row2.col_a = 'X'
    @test_board.row2.col_b = 'O'
    @test_board.row3.col_a = 'X'

    assert(@test_game_end_checker.winner?(board: @test_board, current_player: 1))
  end

  def test_winner_false
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_c = 'O'
    @test_board.row2.col_a = 'X'
    @test_board.row3.col_a = 'O'

    refute(@test_game_end_checker.winner?(board: @test_board, current_player: 2))
  end

  def test_draw_true
    @test_board.row1.col_a = 'X'
    @test_board.row1.col_b = 'O'
    @test_board.row1.col_c = 'X'
    @test_board.row2.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row2.col_c = 'O'
    @test_board.row3.col_a = 'O'
    @test_board.row3.col_b = 'X'
    @test_board.row3.col_c = 'O'

    assert(@test_game_end_checker.draw?(@test_board))
  end

  def test_draw_false
    @test_board.row1.col_b = 'X'
    @test_board.row2.col_a = 'O'
    @test_board.row2.col_b = 'O'
    @test_board.row2.col_c = 'X'
    @test_board.row3.col_b = 'O'

    refute(@test_game_end_checker.draw?(test_moves_double))
  end
end
