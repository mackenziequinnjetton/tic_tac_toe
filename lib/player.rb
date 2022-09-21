class Player
  attr_reader :comp_player

  def initialize(comp_player)
    @comp_player = comp_player
  end

  def get_move(current_player)
    puts "Player #{current_player}, please enter your move (ex: b2)"
    gets.chomp.downcase
  end
end
