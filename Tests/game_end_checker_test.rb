require './game_end_checker'

require 'minitest/autorun'

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
  end

  def test_winner_true
    test_moves_double = [
      row1: [col_a: 'X', col_b: '-', col_c: 'O'],
      row2: [col_a: 'X', col_b: 'O', col_c: '-'],
      row3: [col_a: 'X', col_b: '-', col_c: '-']
    ]

    assert(@test_game_end_checker.winner?(test_moves_double))
  end

  def test_winner_false
    test_moves_double = [%w[X - O], %w[X - -], %w[O - -]]

    refute(@test_game_end_checker.winner?(test_moves_double))
  end

  def test_draw_true
    test_moves_double = [%w[X O X], %w[X X O], %w[O X O]]

    assert(@test_game_end_checker.draw?(test_moves_double))
  end

  def test_draw_false
    test_moves_double = [%w[- X -], %w[O O X], %w[- O -]]

    refute(@test_game_end_checker.draw?(test_moves_double))
  end
end
