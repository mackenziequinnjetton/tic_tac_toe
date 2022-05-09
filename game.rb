require_relative 'board'
require_relative 'board_row'
require_relative 'mover'

class Game
  private

  attr_accessor :board
  attr_reader :board, :mover

  public

  attr_accessor :current_player

  def initialize
    @current_player = 1
    @mover = Mover.new
    # @moves = moveify
    # @moves = [%w[- - -], %w[- - -], %w[- - -]]
    # @board = default_board
    @board = Board.new
  end

  def play
    result = play_helper

    case result
    when :winner_p1
      puts 'Player 1 wins!'
    when :winner_p2
      puts 'Player 2 wins!'
    else
      puts 'The game was a draw. Better luck next time!'
    end

    result
  end

  private

  def play_helper
    winner_p1 = false
    winner_p2 = false
    draw = false

    puts board

    loop do
      move_symbols = mover.make_move(current_player)

      # moves[move_symbols['row']][move_symbols['col']] = (current_player == 1 ? 'X' : 'O')
      board.store_move(hash: move_symbols, current_player: current_player)

      if winner?
        if current_player == 1
          winner_p1 = true
        else
          winner_p2 = true
        end
        break
      elsif draw?
        draw = true
        break
      end
      switch_player
    end

    return :winner_p1 if winner_p1
    return :winner_p2 if winner_p2

    :draw if draw
  end

  # def update_board
  #   @board = default_board
  # end

  # Board = Struct.new(:row1, :row2, :row3, keyword_init: true)
  # BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def moveify
    Board.new(
      row1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row3: BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    )
    # board.map { |board_row| board_row.map { '-' } }

    # moves = [%w[- - -], %w[- - -], %w[- - -]]

    # moves.map { |row| BoardRow.new(row[0], row[1], row[2]) }
  end

  def default_board
    # TODO: Consider breaking into several smaller methods

    "   a     b     c\n" \
    "      |     |\n" \
    "1  #{board.row1.col_a}  |  #{board.row1.col_b}  |  #{board.row1.col_c}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  #{board.row2.col_a}  |  #{board.row2.col_b}  |  #{board.row2.col_c}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  #{board.row3.col_a}  |  #{board.row3.col_b}  |  #{board.row3.col_c}\n" \
    "      |     |\n"
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end

  def winner?
    move_strings = %w[X O]

    win_pattern1 = move_strings.include?(board.row1.col_a) &&
                   board.row2.col_b == board.row1.col_a &&
                   board.row3.col_c == board.row2.col_b

    win_pattern2 = move_strings.include?(board.row1.col_c) &&
                   board.row2.col_b == board.row1.col_c &&
                   board.row3.col_a == board.row2.col_b

    win_pattern3 = move_strings.include?(board.row1.col_a) &&
                   board.row2.col_a == board.row1.col_a &&
                   board.row3.col_a == board.row2.col_a

    win_pattern4 = move_strings.include?(board.row1.col_b) &&
                   board.row2.col_b == board.row1.col_b &&
                   board.row3.col_b == board.row2.col_b

    win_pattern5 = move_strings.include?(board.row1.col_c) &&
                   board.row2.col_c == board.row1.col_c &&
                   board.row3.col_c == board.row2.col_c

    win_pattern6 = move_strings.include?(board.row1.col_a) &&
                   board.row1.col_b == board.row1.col_a &&
                   board.row1.col_c == board.row1.col_b

    win_pattern7 = move_strings.include?(board.row2.col_a) &&
                   board.row2.col_b == board.row2.col_a &&
                   board.row2.col_c == board.row2.col_b

    win_pattern8 = move_strings.include?(board.row3.col_a) &&
                   board.row3.col_b == board.row3.col_a &&
                   board.row3.col_c == board.row3.col_b

    return true if win_pattern1 || win_pattern2 || win_pattern3 || win_pattern4 ||
                   win_pattern5 || win_pattern6 || win_pattern7 || win_pattern8

    false
  end

  def draw?
    true if board.row1.col_a != '-' && board.row1.col_b != '-' && board.row1.col_c != '-' &&
            board.row2.col_a != '-' && board.row2.col_b != '-' && board.row2.col_c != '-' &&
            board.row3.col_a != '-' && board.row3.col_b != '-' && board.row3.col_c != '-'
  end
end
