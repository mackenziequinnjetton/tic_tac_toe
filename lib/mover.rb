class Mover
  def initialize; end

  def make_move(current_player_number:, player_or_opponent:, board:)
    loop do
      move = player_or_opponent.get_move(current_player_number:, board:)

      return move if move.is_a?(Hash)

      unless move.match(/^[a-c][1-3]$/)
        puts 'Your move was not recognized.'
        next
      end

      return move
    end
  end
end
