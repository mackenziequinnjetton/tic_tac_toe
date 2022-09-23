require_relative '../lib/board'
require_relative '../lib/win_patterns'

require 'minitest/autorun'

class WinPatternsTest < Minitest::Test
  def setup
    @test_win_patterns = WinPatterns.new
    @test_board = Board.new
  end

  def test_win_pattern1_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern1?(board: @test_board, str: 'X'))
  end

  def test_win_pattern1_false
    @test_board.row3.col_c = 'X'

    refute(@test_win_patterns.win_pattern1?(board: @test_board, str: 'X'))
  end

  def test_win_pattern2_true
    @test_board.row1.col_c = 'O'
    @test_board.row2.col_b = 'O'
    @test_board.row3.col_a = 'O'

    assert(@test_win_patterns.win_pattern2?(board: @test_board, str: 'O'))
  end

  def test_win_pattern2_false
    @test_board.row2.col_b = 'O'

    refute(@test_win_patterns.win_pattern2?(board: @test_board, str: 'X'))
  end

  def test_win_pattern3_true
    @test_board.row1.col_a = 'X'
    @test_board.row2.col_a = 'X'
    @test_board.row3.col_a = 'X'

    assert(@test_win_patterns.win_pattern3?(board: @test_board, str: 'X'))
  end

  def test_win_pattern3_false
    @test_board.row1.col_a = 'X'

    refute(@test_win_patterns.win_pattern3?(board: @test_board, str: 'X'))
  end

  def test_win_pattern4_true
    @test_board.row1.col_b = 'O'
    @test_board.row2.col_b = 'O'
    @test_board.row3.col_b = 'O'

    assert(@test_win_patterns.win_pattern4?(board: @test_board, str: 'O'))
  end

  def test_win_pattern4_false
    @test_board.row3.col_c = 'O'

    refute(@test_win_patterns.win_pattern4?(board: @test_board, str: 'O'))
  end

  def test_win_pattern5_true
    @test_board.row1.col_c = 'X'
    @test_board.row2.col_c = 'X'
    @test_board.row3.col_c = 'X'

    assert(@test_win_patterns.win_pattern5?(board: @test_board, str: 'X'))
  end

  def test_win_pattern5_false
    @test_board.row2.col_a = 'X'

    refute(@test_win_patterns.win_pattern5?(board: @test_board, str: 'X'))
  end

  def test_win_pattern6_true
    @test_board.row1.col_a = 'O'
    @test_board.row1.col_b = 'O'
    @test_board.row1.col_c = 'O'

    assert(@test_win_patterns.win_pattern6?(board: @test_board, str: 'O'))
  end

  def test_win_pattern6_false
    @test_board.row3.col_b = 'O'

    refute(@test_win_patterns.win_pattern6?(board: @test_board, str: 'O'))
  end

  def test_win_pattern7_true
    @test_board.row2.col_a = 'X'
    @test_board.row2.col_b = 'X'
    @test_board.row2.col_c = 'X'

    assert(@test_win_patterns.win_pattern7?(board: @test_board, str: 'X'))
  end

  def test_win_pattern7_false
    @test_board.row2.col_c = 'X'

    refute(@test_win_patterns.win_pattern7?(board: @test_board, str: 'X'))
  end

  def test_win_pattern8_true
    @test_board.row3.col_a = 'O'
    @test_board.row3.col_b = 'O'
    @test_board.row3.col_c = 'O'

    assert(@test_win_patterns.win_pattern8?(board: @test_board, str: 'O'))
  end

  def test_win_pattern8_false
    @test_board.row1.col_b = 'O'

    refute(@test_win_patterns.win_pattern8?(board: @test_board, str: 'O'))
  end
end
