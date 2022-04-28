require './game'

require 'minitest/autorun'

class GameTest < Minitest::Test
  def setup
    @test_game = Game.new
  end

  def teardown
    @test_game = nil
  end

  def test_board_prints
    # FIXME: Delete if is private method
    # TODO: Use assert_output to verify that the board prints as expected
    skip "Not implemented"
  end

  def test_play
    assert_equal(:game_concluded, @test_game.play)
  end

  def test_move
    exp = 'b3'
    assert_equal(exp, @test_game.move)
  end
end
