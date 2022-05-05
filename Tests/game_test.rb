require './game'
require './input_to_string_io'

require 'minitest/autorun'
require 'stringio'

class GameTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_game = Game.new
  end

  def teardown
    $stdin.close
    $stdin = STDIN
  end

  def test_play_win_p1
    $stdin = input_to_string_io('b2', 'b1', 'c3', 'a3', 'a1')
    assert_equal(:winner_p1, @test_game.play)
  end

  def test_play_win_p2
    $stdin = input_to_string_io('a1', 'c3', 'b3', 'c1', 'b1', 'c2')
    assert_equal(:winner_p2, @test_game.play)
  end

  def test_play_draw
    $stdin = input_to_string_io('c3', 'b3', 'c2', 'c1', 'b2', 'a1', 'b1', 'a2', 'a3')
    assert_equal(:draw, @test_game.play)
  end

  def test_implements_current_player
    assert_respond_to(@test_game, :current_player)
  end

  Board = Struct.new(:row1, :row2, :row3, keyword_init: true)
  BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def exp_moves
    Board.new(
      row1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row3: BoardRow.new(col_a: 'X', col_b: '-', col_c: '-')
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
    $stdin = input_to_string_io('a3')

    @test_game.make_move
    @test_game.update_board

    # Test that the values in each position in each Struct are the same
    assert_equal(exp_moves.row_1.col_a, @test_game.moves.row1.col_a)
    assert_equal(exp_moves.row_1.col_b, @test_game.moves.row1.col_b)
    assert_equal(exp_moves.row_1.col_c, @test_game.moves.row1.col_c)
    assert_equal(exp_moves.row_2.col_a, @test_game.moves.row2.col_a)
    assert_equal(exp_moves.row_2.col_b, @test_game.moves.row2.col_b)
    assert_equal(exp_moves.row_2.col_c, @test_game.moves.row2.col_c)
    assert_equal(exp_moves.row_3.col_a, @test_game.moves.row3.col_a)
    assert_equal(exp_moves.row_3.col_b, @test_game.moves.row3.col_b)
    assert_equal(exp_moves.row_3.col_c, @test_game.moves.row3.col_c)

    # Test that the board outputs properly
    assert_equal(exp_board, @test_game.board)
  end

  def test_display_board
    skip 'Not necessary'
    @test_game.current_player = 2

    $stdin = input_to_string_io('c2')

    @test_game.make_move
    @test_game.update_board

    assert_equal(exp_board, @test_game.board)
  end
end
