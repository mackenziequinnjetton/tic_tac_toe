require_relative '../lib/player'

require 'minitest/autorun'

class PlayerTest < Minitest::Test
  def setup
    @test_player = Player.new(true)
  end

  def test_detect_comp_player
    assert(@test_player.comp_player)
  end

  def test_player_implements_get_move
    assert_respond_to(@test_player, :get_move)
  end

  def test_get_move
    assert_equal('c2', @test_player.get_move)
  end
end
