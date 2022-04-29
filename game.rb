require_relative 'board'

class Game
  attr_accessor :current_player, :moves
  attr_reader :board

  def initialize
    # TODO: Choose starting player at random
    @current_player = :foo
    @moves = [%w[- - -], %w[- - -], %w[- - -]]
    # TODO: Check book to make sure composition was done correctly
    @board = default_board
  end

  # TODO: Consider breaking into several smaller methods
  def default_board
    "   a     b     c\n" \
    "      |     |\n" \
    "1  #{moves[1][1]}  |  #{moves[1][2]}  |  #{moves[1][3]}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "2  #{moves[2][1]}  |  #{moves[2][2]}  |  #{moves[2][3]}\n" \
    " _____|_____|_____\n" \
    "      |     |\n" \
    "3  #{moves[3][1]}  |  #{moves[3][2]}  |  #{moves[3][3]}\n" \
    "      |     |"
  end

  def play
    play_helper

    :game_concluded
  end

  def play_helper
    # TODO: Send messages to make the game work
  end

  def make_move
    move = gets

    # moves[3][1] = 'X' if move == 'c1'

    moves
  end

  private

  def move
    puts "Player #{current_player}, what is your move? (ex: b2)"
  end
end
