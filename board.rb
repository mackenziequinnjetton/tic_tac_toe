require 'enumerable'

class Board
  include Enumerable

  attr_accessor :row1, :row2, :row3

  BoardRow = Struct.new(:col_a, :col_b, :col_c, keyword_init: true)

  def initialize
    @row1 = BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    @row2 = BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
    @row3 = BoardRow.new(col_a: '-', col_b: '-', col_c: '-')
  end
end
