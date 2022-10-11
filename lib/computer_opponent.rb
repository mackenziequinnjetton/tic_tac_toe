class ComputerOpponent
  def initialize; end

  def get_move(current_player_number:, board:)
    rows = %i[row1 row2 row3]
    cols = %i[col_a col_b col_c]
    col_setters = %i[col_a= col_b= col_c=]
    row_methods = [board.method(:row1), board.method(:row2), board.method(:row3)]

    row_methods.each_with_index do |row_method, row_idx|
      board_row_methods = [row_method.call.method(:col_a), row_method.call.method(:col_b),
                           row_method.call.method(:col_c)]

      board_row_methods.each_with_index do |col_method, col_idx|
        return { row: rows[row_idx], col: col_setters[col_idx] } if col_method.call == '-'
      end
    end
  end
end
