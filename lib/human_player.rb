class HumanPlayer
  def initialize; end

  def get_move(current_player_number:, board:)
    puts "Player #{current_player_number}, please enter your move (ex: b2)"
    gets.chomp.downcase
  end
end
