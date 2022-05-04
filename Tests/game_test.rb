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

  def input_to_test_io(*args)
    args.each { |input| @test_io.puts(input) }
    @test_io.rewind

    $stdin = @test_io
  end

  def test_play_win_p_1
    input_to_test_io('b2', 'b1', 'c3', 'a3', 'a1')
    assert_equal(:winner_p_1, @test_game.play)
  end

  def test_play_win_p_2
    input_to_test_io('a1', 'c3', 'b3', 'c1', 'b1', 'c2')
    assert_equal(:winner_p_2, @test_game.play)
  end

  def test_play_draw
    input_to_test_io('c3', 'b3', 'c2', 'c1', 'b2', 'a1', 'b1', 'a2', 'a3')
    assert_equal(:draw, @test_game.play)
  end

  Board = Struct.new(:row_1, :row_2, :row_3, keyword_init: true)
  BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def exp_moves
    Board.new(
      row_1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row_2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row_3: BoardRow.new(col_a: 'X', col_b: '-', col_c: '-')
    )
  end

  def exp_board
    "   a     b     c\n" \
    "      |     |\n" \
    "1  -  |  -  |  -\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  -  |  -  |  -\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  X  |  -  |  -\n" \
    "      |     |\n"
  end

  def test_make_move
    skip
    input_to_test_io('a3')

    @test_game.make_move
    @test_game.update_board

    # Test that the values in each position in each Struct are the same
    assert_equal(exp_moves.row_1.col_a, @test_game.moves.row_1.col_a)
    assert_equal(exp_moves.row_1.col_b, @test_game.moves.row_1.col_b)
    assert_equal(exp_moves.row_1.col_c, @test_game.moves.row_1.col_c)
    assert_equal(exp_moves.row_2.col_a, @test_game.moves.row_2.col_a)
    assert_equal(exp_moves.row_2.col_b, @test_game.moves.row_2.col_b)
    assert_equal(exp_moves.row_2.col_c, @test_game.moves.row_2.col_c)
    assert_equal(exp_moves.row_3.col_a, @test_game.moves.row_3.col_a)
    assert_equal(exp_moves.row_3.col_b, @test_game.moves.row_3.col_b)
    assert_equal(exp_moves.row_3.col_c, @test_game.moves.row_3.col_c)

    # Test that the board outputs properly
    assert_equal(exp_board, @test_game.board)
  end

  def test_display_board
    skip 'Not necessary'
    @test_game.current_player = 2

    input_to_test_io('c2')

    @test_game.make_move
    @test_game.update_board

    assert_equal(exp_board, @test_game.board)
  end
end
