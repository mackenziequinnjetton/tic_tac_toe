require_relative 'board'

class Game
  def initialize
    # TODO: Choose starting player at random
    @current_player = :foo
    # TODO: Check book to make sure composition was done correctly
    @board = Board.new
  end

  def play
    play_helper

    :game_concluded
  end

  def play_helper
    # TODO: Send messages to make the game work
  end

  private

  def move
    puts "Player #{current_player}, what is your move? (ex: b2)"
  end
end
