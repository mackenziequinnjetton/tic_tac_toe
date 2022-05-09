class BoardRow
  include Enumerable

  attr_accessor :col_a, :col_b, :col_c

  def initialize(col_a: '-', col_b: '-', col_c: '-')
    @col_a = col_a
    @col_b = col_b
    @col_c = col_c
  end

  def each
    yield col_a
    yield col_b
    yield col_c
  end
end
