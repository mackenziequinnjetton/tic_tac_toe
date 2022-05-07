require_relative 'board_row'

require 'enumerable'

class Board
  include Enumerable

  attr_accessor :row1, :row2, :row3

  # BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def initialize(row1: BoardRow.new, row2: BoardRow.new, row3: BoardRow.new)
    @row1 = row1
    @row2 = row2
    @row3 = row3
  end
end
