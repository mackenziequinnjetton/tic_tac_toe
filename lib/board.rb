require_relative '../lib/board_row'

class Board
  include Enumerable

  attr_accessor :row1, :row2, :row3

  def initialize(row1: BoardRow.new, row2: BoardRow.new, row3: BoardRow.new)
    @row1 = row1
    @row2 = row2
    @row3 = row3
  end

  def process_move(move:, current_player: 1)
    move_parts = move.split('')

    move_y_hash = Hash['1' => :row1, '2' => :row2, '3' => :row3]
    move_x_hash = Hash['a' => :col_a=, 'b' => :col_b=, 'c' => :col_c=]

    move_y = move_y_hash[move_parts[1]]
    move_x = move_x_hash[move_parts[0]]

    store_move(move_hash: Hash[row: move_y, col: move_x], current_player: )
  end

  def display
    puts "   a     b     c\n" \
         "      |     |\n" \
         "1  #{row1.col_a}  |  #{row1.col_b}  |  #{row1.col_c}\n" \
         " _____|_____|_____\n" \
         "      |     |\n" \
         "2  #{row2.col_a}  |  #{row2.col_b}  |  #{row2.col_c}\n" \
         " _____|_____|_____\n" \
         "      |     |\n" \
         "3  #{row3.col_a}  |  #{row3.col_b}  |  #{row3.col_c}\n" \
         "      |     |\n"
  end

  private

  def store_move(move_hash:, current_player: 1)
    row = move_hash[:row]
    col = move_hash[:col]

    send(row).send(col, (current_player == 1 ? 'X' : 'O'))
  end

  def each
    yield row1
    yield row2
    yield row3
  end
end
