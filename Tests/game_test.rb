require './game'

require 'minitest/autorun'
require 'stringio'

class GameTest < Minitest::Test
  def setup
    @test_game = Game.new
    @test_io = StringIO.new
  end

  def teardown
    @test_io.close
    $stdin = STDIN
  end

  def input_to_test_io(input)
    @test_io.puts(input)
    @test_io.rewind

    $stdin = @test_io
  end

  def reset_test_io
    @test_io.truncate(0)
    @test_io.rewind
  end

  def test_play
    skip
    assert_equal(:game_concluded, @test_game.play)
  end

  def test_make_move
    input_to_test_io('a3')

    @test_game.make_move

    assert_equal([%w[- - -], %w[- - -], %w[X - -]], @test_game.moves)

    reset_test_io
  end

  def exp_board
    "   a     b     c\n" \
    "      |     |\n" \
    "1  -  |  -  |  -\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  -  |  -  |  O\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  -  |  -  |  -\n" \
    "      |     |\n"
  end

  def test_display_board
    input_to_test_io('c2')

    @test_game.make_move
    @test_game.update_board

    assert_equal(exp_board, @test_game.board)
    # assert_output(exp_board) { @test_game.board }

    reset_test_io
  end
end
