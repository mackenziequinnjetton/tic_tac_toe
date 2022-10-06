require_relative '../lib/human_opponent'
require_relative './helpers/input_to_string_io'

require 'minitest/autorun'

class HumanOpponentTest < Minitest::Test
  include InputToStringIo
  def setup
    @test_player = HumanOpponent.new
  end

  def test_get_move
    $stdin = input_to_string_io('c2')
    current_player = 1

    assert_equal('c2', @test_player.get_move(current_player))
  end
end
