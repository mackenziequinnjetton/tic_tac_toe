require './board'
require './win_patterns'

require 'minitest/autorun'

class WinPatternsTest < Minitest::Test
  def setup
    @test_win_patterns = WinPatterns.new
    @test_board = Board.new
  end

  def teardown
    # Do nothing
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_false
    @test_board.row3.col_c = 'X'

    refute(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1(board: @test_board, str: 'X'))
  end
end
