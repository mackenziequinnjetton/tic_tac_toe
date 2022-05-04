class Mover
  def make_move
    loop do
      puts "Player #{current_player}, please enter your move (ex: b2)"
      move = gets.chomp.downcase

      unless move.match(/^[a-c][1-3]$/)
        puts 'Your move was not recognized.'
        next
      end

      move_parts = move.split('')

      move_y_hash = Hash['1' => :row1, '2' => :row2, '3' => :row3]
      move_x_hash = Hash['a' => :col_a, 'b' => :col_b, 'c' => :col_c]

      move_y = move_y_hash[move_parts[1]]
      move_x = move_x_hash[move_parts[0]]

      moves[move_y][move_x] = (current_player == 1 ? 'X' : 'O')
      break
    end
  end
end
