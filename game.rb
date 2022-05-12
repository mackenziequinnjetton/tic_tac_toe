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
  end

  def play
    result = play_helper

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

  private

  def play_helper
    winner_p1 = false
    winner_p2 = false
    draw = false

    puts board.display

    loop do
      move_symbols = mover.make_move(current_player)

      board.store_move(hash: move_symbols, current_player: current_player)

      if game_end_checker.winner?(board: board, current_player: current_player)
        if current_player == 1
          winner_p1 = true
        else
          winner_p2 = true
        end
        break
      elsif game_end_checker.draw?(board)
        draw = true
        break
      end
      switch_player
    end

    return :winner_p1 if winner_p1
    return :winner_p2 if winner_p2

    :draw if draw
  end

  # def update_board
  #   @board = default_board
  # end

  # Board = Struct.new(:row1, :row2, :row3, keyword_init: true)
  # BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def moveify
    Board.new(
      row1: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row2: BoardRow.new(col_a: '-', col_b: '-', col_c: '-'),
      row3: BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    )
    # board.map { |board_row| board_row.map { '-' } }

    # moves = [%w[- - -], %w[- - -], %w[- - -]]

    # moves.map { |row| BoardRow.new(row[0], row[1], row[2]) }
  end

  def switch_player
    self.current_player = (current_player == 1 ? 2 : 1)
  end
end
