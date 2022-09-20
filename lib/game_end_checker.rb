require_relative '../lib/win_patterns'

class GameEndChecker
  private

  attr_reader :win_patterns

  public

  def initialize
    @win_patterns = WinPatterns.new
  end

  def check_game_end(board:, current_player:)
    if winner?(board: board, current_player: current_player)
      current_player == 1 ? :winner_p1 : :winner_p2
    elsif draw?(board)
      :draw
    end
  end

  private

  def winner?(board:, current_player:)
    win_pattern_array = win_pattern_array(board: board, str: current_player_string(current_player))

    win_pattern_array.any? true
  end

  # Meant to be invoked after a winner has already been checked for
  def draw?(board)
    return true if board.all? { |row| row.all? { |col| col != '-' } }

    false
  end

  def current_player_string(current_player)
    current_player == 1 ? 'X' : 'O'
  end

  def win_pattern_array(board:, str:)
    [
      win_patterns.win_pattern1?(board: board, str: str),
      win_patterns.win_pattern2?(board: board, str: str),
      win_patterns.win_pattern3?(board: board, str: str),
      win_patterns.win_pattern4?(board: board, str: str),
      win_patterns.win_pattern5?(board: board, str: str),
      win_patterns.win_pattern6?(board: board, str: str),
      win_patterns.win_pattern7?(board: board, str: str),
      win_patterns.win_pattern8?(board: board, str: str)
    ]
  end
end
