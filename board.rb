require_relative 'board_row'

class Board
  include Enumerable

  attr_accessor :row1, :row2, :row3

  def initialize(row1: BoardRow.new, row2: BoardRow.new, row3: BoardRow.new)
    @row1 = row1
    @row2 = row2
    @row3 = row3
  end

  def store_move(hash:, current_player: 1)
    row = hash[:row]
    col = hash[:col]

    send(row).send(col, (current_player == 1 ? 'X' : 'O'))
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

  def each
    yield row1
    yield row2
    yield row3
  end
end
