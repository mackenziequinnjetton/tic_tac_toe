class Mover
  def initialize; end

  def make_move(current_player)
    loop do
      move = get_move(current_player)

      unless move.match(/^[a-c][1-3]$/)
        puts 'Your move was not recognized.'
        next
      end

      move_parts = move.split('')

      move_y_hash = Hash['1' => :row1, '2' => :row2, '3' => :row3]
      move_x_hash = Hash['a' => :col_a=, 'b' => :col_b=, 'c' => :col_c=]

      move_y = move_y_hash[move_parts[1]]
      move_x = move_x_hash[move_parts[0]]

      return Hash[row: move_y, col: move_x]

      # moves[move_y][move_x] = (current_player == 1 ? 'X' : 'O')
      # break
    end
  end

  def display

  end

  private

  def get_move(current_player)
    puts "Player #{current_player}, please enter your move (ex: b2)"
    gets.chomp.downcase
  end
end
