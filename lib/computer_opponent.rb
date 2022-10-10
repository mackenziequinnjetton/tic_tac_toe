class ComputerOpponent
  def initialize; end

  def get_move(*, board:)
    rows = %i[row1 row2 row3]
    cols = %i[col_a col_b col_c]
    row_methods = [board.method(:row1), board.method(:row2), board.method(:row3)]

    row_methods.each_with_index do |row_method, row_idx|
      board_row_methods = [row_method.call.method(:col_a), row_method.call.method(:col_b),
                           row_method.call.method(:col_c)]

      board_row_methods.each_with_index do |col_method, col_idx|
        return { row: rows[row_idx], col: cols[col_idx] } if col_method.call == '-'
      end
    end
  end

  def incomplete_message
    "We're sorry, computer player support is not fully implemented yet. Please try again later!"
  end
end
