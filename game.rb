require_relative 'board'

class Game
  attr_accessor :current_player, :moves
  attr_reader :board

  def initialize
    @current_player = 1
    @moves = moveify
    #@moves = [%w[- - -], %w[- - -], %w[- - -]]
    @board = default_board
  end

  def play
    play_helper

    :game_concluded
  end

  def play_helper
    game_concluded = false

    puts board

    until game_concluded
      make_move
      game_concluded = winner?
      switch_player
    end
  end

  def make_move
    loop do
      puts "Player #{current_player}, please enter your move (ex: b2)"
      move = gets.chomp.downcase

      unless move.match(/^[a-c][1-3]$/)
        puts 'Your move was not recognized.'
        next
      end

      move_parts = move.split('')

      move_y_hash = Hash['1' => :row_1, '2' => :row_2, '3' => :row_3]
      move_x_hash = Hash['a' => :col_a, 'b' => :col_b, 'c' => :col_c]

      move_y = move_y_hash[move_parts[1]]
      move_x = move_x_hash[move_parts[0]]

      moves[move_y][move_x] = (current_player == 1 ? 'X' : 'O')
      break
    end
  end

  def update_board
    @board = default_board
  end

  private

  Board = Struct.new(:row_1, :row_2, :row_3, keyword_init: true)
  BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def moveify
    Board.new(
      row_1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row_2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row_3: BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    )
    # board.map { |board_row| board_row.map { '-' } }

    # moves = [%w[- - -], %w[- - -], %w[- - -]]

    # moves.map { |row| BoardRow.new(row[0], row[1], row[2]) }
  end

  def default_board
    # TODO: Consider breaking into several smaller methods

    "   a     b     c\n" \
    "      |     |\n" \
    "1  #{moves.row_1.col_a}  |  #{moves.row_1.col_b}  |  #{moves.row_1.col_c}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  #{moves.row_2.col_a}  |  #{moves.row_2.col_b}  |  #{moves.row_2.col_c}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  #{moves.row_3.col_a}  |  #{moves.row_3.col_b}  |  #{moves.row_3.col_c}\n" \
    "      |     |\n"
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end

  def winner?
    move_strings = %w[X O]
    winner = false

    win_pattern_1 = move_strings.include?(moves.row_1.col_a) &&
                    moves.row_2.col_b == moves.row_1.col_a &&
                    moves.row_3.col_c == moves.row_2.col_b

    win_pattern_2 = move_strings.include?(moves.row_1.col_c) &&
      moves.row_2.col_b == moves.row_1.col_c &&
      moves.row_3.col_a == moves.row_2.col_b

    win_pattern_3 = move_strings.include?(moves.row_1.col_a) &&
      moves.row_2.col_a == moves.row_1.col_a &&
      moves.row_3.col_a == moves.row_2.col_a

    win_pattern_4 = move_strings.include?(moves.row_1.col_b) &&
      moves.row_2.col_b == moves.row_1.col_b &&
      moves.row_3.col_b == moves.row_2.col_b

    win_pattern_5 = move_strings.include?(moves.row_1.col_c) &&
      moves.row_2.col_c == moves.row_1.col_c &&
      moves.row_3.col_c == moves.row_2.col_c

    win_pattern_6 = move_strings.include?(moves.row_1.col_a) &&
      moves.row_1.col_b == moves.row_1.col_a &&
      moves.row_1.col_c == moves.row_1.col_b

    win_pattern_7 = move_strings.include?(moves.row_2.col_a) &&
      moves.row_2.col_b == moves.row_2.col_a &&
      moves.row_2.col_c == moves.row_2.col_b

    win_pattern_8 = move_strings.include?(moves.row_3.col_a) &&
      moves.row_3.col_b == moves.row_3.col_a &&
      moves.row_3.col_c == moves.row_3.col_b

    (1..8)
    true if win_pattern_1 || win_pattern_2 || win_pattern_3 || win_pattern_4 ||
      win_pattern_5 || win_pattern_6 || win_pattern_7 || win_pattern_8
  end
end
