class Player
  attr_reader :comp_player

  def initialize(comp_player)
    @comp_player = comp_player
  end

  def get_move
    'c2'
  end
end
