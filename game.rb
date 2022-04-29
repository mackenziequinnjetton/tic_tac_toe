require_relative 'board'

class Game
  attr_accessor :current_player, :moves
  attr_reader :board

  def initialize
    @current_player = 1
    @moves = [%w[- - -], %w[- - -], %w[- - -]]
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
      move_x_index = Hash['a' => 0, 'b' => 1, 'c' => 2]
      move_x = move_x_index[move_parts[0]]
      move_y = move_parts[1].to_i - 1

      moves[move_y][move_x] = (current_player == 1 ? 'X' : 'O')

      break
    end
  end

  def update_board
    @board = default_board
  end

  private

  def default_board
    # TODO: Consider breaking into several smaller methods

    "   a     b     c\n" \
    "      |     |\n" \
    "1  #{moves[0][0]}  |  #{moves[0][1]}  |  #{moves[0][2]}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  #{moves[1][0]}  |  #{moves[1][1]}  |  #{moves[1][2]}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  #{moves[2][0]}  |  #{moves[2][1]}  |  #{moves[2][2]}\n" \
    "      |     |\n"
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end
end
