

class Game
  def initialize

  end

  def play
    play_helper

    :game_concluded
  end

  def play_helper
    # TODO: Send messages to make the game work
  end

  def move
    puts "Player #{current_player}, what is your move? (ex: b2)"
  end
end
