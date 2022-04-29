require './game'
# FIXME: Remove once board no longer needed
require './board'

require 'minitest/autorun'
require 'stringio'

class GameTest < Minitest::Test
  def setup
    @test_game = Game.new
    # @test_board = Board.new
  end

  def teardown; end

  def test_play
    assert_equal(:game_concluded, @test_game.play)
  end

  def test_make_move
    move_io = StringIO.new
    move_io.puts('c1')
    move_io.rewind

    $stdin = move_io

    @test_game.make_move

    # TODO: Figure out how to stub user input

    assert_equal([%w[- - -], %w[- - -], %w[X - -]], @test_game.moves)

    move_io.close
    $stdin = STDIN
  end

  # TODO: Consider deleting, as testing play verifies that board is correct
  def test_display_board
    skip 'Not finished'
    # TODO: Figure out how to stub user input
    @test_game.moves = [%w[- - -], %w[- - O], %w[- - -]]

    exp = "   a     b     c\n" \
          "      |     |\n" \
          "1  -  |  -  |  -\n" \
          " _____|_____|_____\n" \
          "      |     |\n" \
          "2  -  |  -  |  O\n" \
          " _____|_____|_____\n" \
          "      |     |\n" \
          "3  -  |  -  |  -\n" \
          "      |     |"

    assert_output(exp) { @test_game.display_board }
  end
end
