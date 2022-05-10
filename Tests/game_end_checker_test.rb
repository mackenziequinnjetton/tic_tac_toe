require '.game_end_checker'

require 'minitest/autorun'

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
  end

  def teardown
    # Do nothing
  end

  def test_winner_true
    assert(@test_game_end_checker.winner?)
  end

  def test_winner_false
    refute(@test_game_end_checker.winner?)
  end

  def test_draw_true
    assert(@test_game_end_checker.draw?)
  end

  def test_draw_false
    refute(@test_game_end_checker.draw?)
  end
end
