#: TODO: Add Enumerable module
class BoardRow
  attr_accessor :col_a, :col_b, :col_c

  def initialize(col_a: '-', col_b: '-', col_c: '-')
    @col_a = col_a
    @col_b = col_b
    @col_c = col_c
  end
end
