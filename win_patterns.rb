class WinPatterns
  def win_pattern1?(board:, str:)
    [board.row1.col_a, board.row2.col_b, board.row3.col_c].all? { |elem| elem == str }
  end

  def win_pattern2?(board:, str:)
    [board.row1.col_c, board.row2.col_b, board.row3.col_a].all? { |elem| elem == str }
  end

  def win_pattern3?(board:, str:)
    [board.row1.col_a, board.row2.col_a, board.row3.col_a].all? { |elem| elem == str }
  end

  def win_pattern4?(board:, str:)
    [board.row1.col_b, board.row2.col_b, board.row3.col_b].all? { |elem| elem == str }
  end

  def win_pattern5?(board:, str:)
    [board.row1.col_c, board.row2.col_c, board.row3.col_c].all? { |elem| elem == str }
  end

  def win_pattern6?(board:, str:)
    [board.row1.col_a, board.row1.col_b, board.row1.col_c].all? { |elem| elem == str }
  end

  def win_pattern7?(board:, str:)
    [board.row2.col_a, board.row2.col_b, board.row2.col_c].all? { |elem| elem == str }
  end

  def win_pattern8?(board:, str:)
    [board.row3.col_a, board.row3.col_b, board.row3.col_c].all? { |elem| elem == str }
  end
end
