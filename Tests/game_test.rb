require './game'
# FIXME: Remove once board no longer needed
require './board'

require 'minitest/autorun'

class GameTest < Minitest::Test
  def setup
    @test_game = Game.new
    @test_board = Board.new
  end

  def teardown

  end

  def test_play
    assert_equal(:game_concluded, @test_game.play)
  end

  def test_get_moves
    # TODO: Remove need to initialize a board

    exp = 'b3'
    assert_equal(exp, @test_game.move)
  end

  def test_get_blank_moves
    exp = [%w[- - -], %w[- - -], %w[- - -]]
    assert_equal(exp, @test_board.moves)
  end
end
