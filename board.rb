class Board
  attr_accessor :moves
  attr_reader :layout

  def initialize
    # TODO: Move 2D array somehow, look at book for details
    @moves = [%w[- - -], %w[- - -], %w[- - -]]
    @layout = "   a     b     c\n" \
              "      |     |\n" \
              "1  -  |  -  |  -\n" \
              " _____|_____|_____\n" \
              "      |     |\n" \
              "2  -  |  -  |  -\n" \
              " _____|_____|_____\n" \
              "      |     |\n" \
              "3  -  |  -  |  -\n" \
              "      |     |"
  end
end
