require './TicTacToe'

require 'minitest/autorun'

class TicTacToeTest < Minitest::Test
  def setup
    test_tic_tac_toe = TicTacToe.new
  end

  def teardown
    # Do nothing
  end

  def test
    skip 'Not implemented'
  end
end
