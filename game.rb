require_relative 'mover'
require_relative 'board'
require_relative 'game_end_checker'

class Game
  private

  attr_reader :board, :game_end_checker, :mover
  attr_writer :current_player

  public

  attr_reader :current_player

  def initialize
    @current_player = 1
    @mover = Mover.new
    @board = Board.new
    @game_end_checker = GameEndChecker.new

    play
  end

  def play
    welcome_message
    print_result(play_helper)
  end

  private

  def welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def play_helper
    puts board.display

    game_loop
  end

  def game_loop
    loop do
      move_symbols = mover.make_move(current_player)

      board.store_move(hash: move_symbols, current_player: current_player)

      game_end_result = game_end_checker.check_game_end(board: board, current_player: current_player)

      return game_end_result if %i[winner_p1 winner_p2 draw].include? game_end_result

      puts board.display

      switch_player
    end
  end

  def print_result(result)
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

  def moveify
    Board.new(
      row1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row3: BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    )
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end
end
