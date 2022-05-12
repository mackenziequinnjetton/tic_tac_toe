class GameEndChecker
  def winner?(board)
    move_strings = %w[X O]

    win_pattern1 = move_strings.include?(board.row1.col_a) &&
                   board.row2.col_b == board.row1.col_a &&
                   board.row3.col_c == board.row2.col_b

    win_pattern2 = move_strings.include?(board.row1.col_c) &&
                   board.row2.col_b == board.row1.col_c &&
                   board.row3.col_a == board.row2.col_b

    win_pattern3 = move_strings.include?(board.row1.col_a) &&
                   board.row2.col_a == board.row1.col_a &&
                   board.row3.col_a == board.row2.col_a

    win_pattern4 = move_strings.include?(board.row1.col_b) &&
                   board.row2.col_b == board.row1.col_b &&
                   board.row3.col_b == board.row2.col_b

    win_pattern5 = move_strings.include?(board.row1.col_c) &&
                   board.row2.col_c == board.row1.col_c &&
                   board.row3.col_c == board.row2.col_c

    win_pattern6 = move_strings.include?(board.row1.col_a) &&
                   board.row1.col_b == board.row1.col_a &&
                   board.row1.col_c == board.row1.col_b

    win_pattern7 = move_strings.include?(board.row2.col_a) &&
                   board.row2.col_b == board.row2.col_a &&
                   board.row2.col_c == board.row2.col_b

    win_pattern8 = move_strings.include?(board.row3.col_a) &&
                   board.row3.col_b == board.row3.col_a &&
                   board.row3.col_c == board.row3.col_b

    return true if win_pattern1 || win_pattern2 || win_pattern3 || win_pattern4 ||
                   win_pattern5 || win_pattern6 || win_pattern7 || win_pattern8

    false
  end

  # Meant to be invoked after a winner has already been checked for
  def draw?(board)
    return true if board.all? { |row| row.all? { |col| col != '-' } }

    false
  end
end
