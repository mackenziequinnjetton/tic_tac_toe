require_relative 'board'

class Game
  attr_accessor :current_player, :moves
  attr_reader :board

  def initialize
    # TODO: Choose starting player at random
    @current_player = starting_player
    @moves = [%w[- - -], %w[- - -], %w[- - -]]
    # TODO: Check book to make sure composition was done correctly
    @board = default_board
  end

  def play
    play_helper

    :game_concluded
  end

  def play_helper
    game_concluded = false

    display_board

    until game_concluded
      make_move
      switch_player
    end
  end

  def make_move
    puts "Player #{current_player}, please enter your move (ex: b2)"
    move = gets.chomp

    moves[2][0] = 'X' if move == 'a3'
    moves[1][2] = 'O' if move == 'c2'
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

  def starting_player
    random = Random.new

    random.rand(1..2)
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end
end
