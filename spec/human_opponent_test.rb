require 'human_opponent'
require 'input_to_string_io'

require 'minitest/autorun'

class HumanOpponentTest < Minitest::Test
  include InputToStringIo
  def setup
    @test_player = HumanPlayer.new
  end

  def test_get_move
    $stdin = input_to_string_io('c2')
    current_player_number = 1
    board = Board.new

    exp = 'c2'
    act = @test_player.get_move(current_player_number:, board:)


    assert_equal(exp, act)
  end
end
