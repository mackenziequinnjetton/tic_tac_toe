require_relative '../lib/player'
require_relative './helpers/input_to_string_io'

require 'minitest/autorun'

class PlayerTest < Minitest::Test
  include InputToStringIo
  def setup
    @test_player = Player.new
  end

  def test_player_implements_get_move
    assert_respond_to(@test_player, :get_move)
  end

  def test_get_move
    $stdin = input_to_string_io('c2')
    current_player = 1

    assert_equal('c2', @test_player.get_move(current_player))
  end
end
