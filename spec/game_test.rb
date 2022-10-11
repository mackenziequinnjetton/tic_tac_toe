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

  def test_play_win_p1_human_opponent
    $stdin = input_to_string_io('human', 'b2', 'b1', 'c3', 'a3', 'a1')
    assert_equal(:winner_p1, @test_game.play)
  end

  def test_play_win_p2_human_opponent
    $stdin = input_to_string_io('human', 'a1', 'c3', 'b3', 'c1', 'b1', 'c2')
    assert_equal(:winner_p2, @test_game.play)
  end

  def test_play_draw_human_opponent
    $stdin = input_to_string_io('human', 'c3', 'b3', 'c2', 'c1', 'b2', 'a1', 'b1', 'a2', 'a3')
    assert_equal(:draw, @test_game.play)
  end

  def test_play_win_p1_computer_opponent
    $stdin = input_to_string_io('computer', 'b3', 'b1', 'b2')
    assert_equal(:winner_p1, @test_game.play)
  end

  def test_play_win_p2_computer_opponent
    $stdin = input_to_string_io('computer', 'c3', 'b2', 'b3')
    assert_equal(:winner_p2, @test_game.play)
  end

  def test_play_draw_computer_opponent
    $stdin = input_to_string_io('computer', 'a2', 'b1', 'b2', 'a3', 'c3')
    assert_equal(:draw, @test_game.play)
  end

  def test_implements_current_player
    assert_respond_to(@test_game, :current_player_number)
  end
end
