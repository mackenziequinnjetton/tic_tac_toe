require './board_row'

require 'minitest/autorun'

class BoardRowTest < Minitest::Test
  def setup
    @test_board_row = BoardRow.new
  end

  def teardown
    # Do nothing
  end
end
