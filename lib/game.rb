require 'mover'
require 'board'
require 'game_end_checker'
require 'opponent_selector'
require 'human_player'
require 'message_displayer'
require 'computer_opponent'

class Game
  private

  attr_reader :board, :game_end_checker, :mover, :player

  public

  attr_accessor :opponent, :opponent_selector, :current_player_number
  attr_reader :message_displayer

  def initialize
    @player = HumanPlayer.new
    @opponent = nil
    @current_player_number = nil
    @message_displayer = MessageDisplayer.new
    @opponent_selector = OpponentSelector.new
    @mover = Mover.new
    @board = Board.new
    @game_end_checker = GameEndChecker.new
  end

  def play
    puts message_displayer.welcome_message
    self.opponent = opponent_selector.choose_opponent
    self.current_player_number =
      opponent.is_a?(ComputerOpponent) ? @message_displayer.go_first_or_second : 1
    message_displayer.game_result(play_helper)
  end

  private

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

      if %i[winner_p1 winner_p2 draw].include? game_end_result
        board.display
        return game_end_result
      end

      board.display

      switch_player
    end
  end

  def switch_player
    self.current_player_number = (current_player_number == 1 ? 2 : 1)
  end
end
