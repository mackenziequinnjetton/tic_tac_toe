class GameEndChecker
  private

  attr_reader :move_strings, :win_patterns

  public

  def initialize
    # @move_strings = %w[X O]

    @move_strings = { player1: 'X', player2: 'O' }
    @win_patterns = WinPatterns.new
  end

  def winner?(board:, current_player:)
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

    win_pattern_array = %i[win_pattern1 win_pattern2 win_pattern3 win_pattern4
                           win_pattern5 win_pattern6 win_pattern7 win_pattern8]

    win_pattern_array = win_pattern_array.map do |pattern|
      send(pattern, board: board, current_player: current_player)
    end

    win_pattern_array.any? true

    # return true if win_pattern1 || win_pattern2 || win_pattern3 || win_pattern4 ||
    #                win_pattern5 || win_pattern6 || win_pattern7 || win_pattern8

    false
  end

  # Meant to be invoked after a winner has already been checked for
  def draw?(board)
    return true if board.all? { |row| row.all? { |col| col != '-' } }

    false
  end

  private

  def win_pattern1(board:, current_player:)
    current_player_string = (current_player == 1 ? move_strings[:player1] : move_strings[:player2])

    [board.row1.col_a, board.row2.col_b, board.row3.col_c].all? { |elem| elem == current_player_string }
  end
end
