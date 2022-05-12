require './game_end_checker'

require 'minitest/autorun'

class BoardRowDouble
  include Enumerable

  attr_accessor :col_a, :col_b, :col_c

  def initialize(col_a: '-', col_b: '-', col_c: '-')
    @col_a = col_a
    @col_b = col_b
    @col_c = col_c
  end

  def each
    yield col_a
    yield col_b
    yield col_c
  end
end

class BoardDouble
  include Enumerable

  attr_accessor :row1, :row2, :row3

  def initialize(row1: BoardRowDouble.new, row2: BoardRowDouble.new, row3: BoardRowDouble.new)
    @row1 = row1
    @row2 = row2
    @row3 = row3
  end

  def each
    yield row1
    yield row2
    yield row3
  end
end

class GameEndCheckerTest < Minitest::Test
  def setup
    @test_game_end_checker = GameEndChecker.new
    @test_board_double = BoardDouble.new
  end

  def test_winner_true
    @test_board_double.row1.col_a = 'X'
    @test_board_double.row1.col_c = 'O'
    @test_board_double.row2.col_a = 'X'
    @test_board_double.row2.col_b = 'O'
    @test_board_double.row3.col_a = 'X'

    assert(@test_game_end_checker.winner?(@test_board_double))
  end

  def test_winner_false
    @test_board_double.row1.col_a = 'X'
    @test_board_double.row1.col_c = 'O'
    @test_board_double.row2.col_a = 'X'
    @test_board_double.row3.col_a = 'O'

    refute(@test_game_end_checker.winner?(@test_board_double))
  end

  def test_draw_true
    @test_board_double.row1.col_a = 'X'
    @test_board_double.row1.col_b = 'O'
    @test_board_double.row1.col_c = 'X'
    @test_board_double.row2.col_a = 'X'
    @test_board_double.row2.col_b = 'X'
    @test_board_double.row2.col_c = 'O'
    @test_board_double.row3.col_a = 'O'
    @test_board_double.row3.col_b = 'X'
    @test_board_double.row3.col_c = 'O'

    assert(@test_game_end_checker.draw?(@test_board_double))
  end

  def test_draw_false
    test_moves_double = [%w[- X -], %w[O O X], %w[- O -]]

    @test_board_double.row1.col_b = 'X'
    @test_board_double.row2.col_a = 'O'
    @test_board_double.row2.col_b = 'O'
    @test_board_double.row2.col_c = 'X'
    @test_board_double.row3.col_b = 'O'

    refute(@test_game_end_checker.draw?(test_moves_double))
  end
end
