require 'win_patterns'

class GameEndChecker
  private

  attr_reader :win_patterns

  public

  def initialize
    @win_patterns = WinPatterns.new
  end

  def check_game_end(board:, current_player_number:)
    if winner?(board:, current_player_number:)
      current_player_number == 1 ? :winner_p1 : :winner_p2
    elsif draw?(board)
      :draw
    end
  end

  private

  def winner?(board:, current_player_number:)
    win_pattern_array = win_pattern_array(board:, str: current_player_string(current_player_number))

    win_pattern_array.any? true
  end

  # Meant to be invoked after a winner has already been checked for
  def draw?(board)
    return true if board.all? { |row| row.all? { |col| col != '-' } }

    false
  end

  def current_player_string(current_player_number)
    current_player_number == 1 ? 'X' : 'O'
  end

  def win_pattern_array(board:, str:)
    [
      win_patterns.win_pattern1?(board:, str:),
      win_patterns.win_pattern2?(board:, str:),
      win_patterns.win_pattern3?(board:, str:),
      win_patterns.win_pattern4?(board:, str:),
      win_patterns.win_pattern5?(board:, str:),
      win_patterns.win_pattern6?(board:, str:),
      win_patterns.win_pattern7?(board:, str:),
      win_patterns.win_pattern8?(board:, str:)
    ]
  end
end
