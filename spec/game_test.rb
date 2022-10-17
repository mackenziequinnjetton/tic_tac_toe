require 'game'
require 'input_to_string_io'

require 'minitest/autorun'
require 'stringio'

class GameTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_game = Game.new
    $stdout = StringIO.new
  end

  def teardown
    $stdin.close
    $stdin = STDIN
  end

  def test_play_win_p1_human
    $stdin = input_to_string_io('human', 'b2', 'b1', 'c3', 'a3', 'a1')
    assert_equal(:winner_p1, @test_game.play)
  end

  def test_play_win_p2_human
    $stdin = input_to_string_io('human', 'a1', 'c3', 'b3', 'c1', 'b1', 'c2')
    assert_equal(:winner_p2, @test_game.play)
  end

  def test_play_draw_human
    $stdin = input_to_string_io('human', 'c3', 'b3', 'c2', 'c1', 'b2', 'a1', 'b1', 'a2', 'a3')
    assert_equal(:draw, @test_game.play)
  end

  def test_play_computer
    $stdin = input_to_string_io('computer')
    assert_equal(:incomplete, @test_game.play)
  end

  def test_implements_current_player
    assert_respond_to(@test_game, :current_player)
  end
end
