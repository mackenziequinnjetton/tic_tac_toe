require 'mover'
require 'board'
require 'game_end_checker'
require 'opponent_selector'

class Game
  private

  attr_reader :board, :game_end_checker, :mover, :player
  attr_writer :current_player_number

  public

  attr_accessor :opponent, :opponent_selector
  attr_reader :current_player_number

  def initialize
    @player = HumanPlayer.new
    @opponent = nil
    @current_player_number = 1
    @opponent_selector = OpponentSelector.new
    @mover = Mover.new
    @board = Board.new
    @game_end_checker = GameEndChecker.new
  end

  def play
    welcome_message
    self.opponent = opponent_selector.choose_opponent
    print_result(play_helper)
  end

  private

  def welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def play_helper
    board.display

    game_loop
  end

  def game_loop
    loop do
      player_or_opponent = current_player_number == 1 ? player : opponent
      move = mover.make_move(current_player_number:, player_or_opponent:, board:)

      board.process_move(move:, current_player_number:)

      game_end_result = game_end_checker.check_game_end(board:, current_player_number:)

      return game_end_result if %i[winner_p1 winner_p2 draw].include? game_end_result

      board.display

      switch_player
    end
  end

  def print_result(result)
    board.display

    case result
    when :winner_p1
      puts 'Player 1 wins!'
    when :winner_p2
      puts 'Player 2 wins!'
    else
      puts 'The game was a draw. Better luck next time!'
    end

    result
  end

  def switch_player
    self.current_player_number = (current_player_number == 1 ? 2 : 1)
  end
end
