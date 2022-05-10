class GameEndChecker
  def winner?(moves)
    move_strings = %w[X O]

    win_pattern1 = move_strings.include?(moves.row1.col_a) &&
                   moves.row2.col_b == moves.row1.col_a &&
                   moves.row3.col_c == moves.row2.col_b

    win_pattern2 = move_strings.include?(moves.row1.col_c) &&
                   moves.row2.col_b == moves.row1.col_c &&
                   moves.row3.col_a == moves.row2.col_b

    win_pattern3 = move_strings.include?(moves.row1.col_a) &&
                   moves.row2.col_a == moves.row1.col_a &&
                   moves.row3.col_a == moves.row2.col_a

    win_pattern4 = move_strings.include?(moves.row1.col_b) &&
                   moves.row2.col_b == moves.row1.col_b &&
                   moves.row3.col_b == moves.row2.col_b

    win_pattern5 = move_strings.include?(moves.row1.col_c) &&
                   moves.row2.col_c == moves.row1.col_c &&
                   moves.row3.col_c == moves.row2.col_c

    win_pattern6 = move_strings.include?(moves.row1.col_a) &&
                   moves.row1.col_b == moves.row1.col_a &&
                   moves.row1.col_c == moves.row1.col_b

    win_pattern7 = move_strings.include?(moves.row2.col_a) &&
                   moves.row2.col_b == moves.row2.col_a &&
                   moves.row2.col_c == moves.row2.col_b

    win_pattern8 = move_strings.include?(moves.row3.col_a) &&
                   moves.row3.col_b == moves.row3.col_a &&
                   moves.row3.col_c == moves.row3.col_b

    return true if win_pattern1 || win_pattern2 || win_pattern3 || win_pattern4 ||
                   win_pattern5 || win_pattern6 || win_pattern7 || win_pattern8

    false
  end

  def draw?(moves)
    return true if moves.all? { |row| row.all? { |col| col != '-' } }

    false
  end
end
