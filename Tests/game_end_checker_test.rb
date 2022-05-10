require '.game_end_checker'

require 'minitest/autorun'

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
  end

  def test_winner_true
    test_moves = [%w[X - O], %w[X O -], %w[X - -]]

    assert(@test_game_end_checker.winner?(test_moves))
  end

  def test_winner_false
    test_moves = [%w[X - O], %w[X - -], %w[O - -]]

    refute(@test_game_end_checker.winner?(test_moves))
  end

  def test_draw_true
    test_moves = [%w[X O X], %w[X X O], %w[O X O]]

    assert(@test_game_end_checker.draw?(test_moves))
  end

  def test_draw_false
    test_moves = [%w[- X -], %w[O O X], %w[- O -]]

    refute(@test_game_end_checker.draw?(test_moves))
  end
end
