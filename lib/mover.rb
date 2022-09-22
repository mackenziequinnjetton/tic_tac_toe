class Mover
  def initialize; end

  def make_move(current_player)
    loop do
      move = get_move(current_player)

      unless move.match(/^[a-c][1-3]$/)
        puts 'Your move was not recognized.'
        next
      end

      return move
    end
  end

  private

  def get_move(current_player)
    puts "Player #{current_player}, please enter your move (ex: b2)"
    gets.chomp.downcase
  end
end
