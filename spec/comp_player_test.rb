require 'minitest/autorun'
require_relative '../lib/comp_player'

class CompPlayerTest < Minitest::Test
  def setup
    @test_comp_player = CompPlayer.new
  end

  def test_create_comp_player
    assert_instance_of(CompPlayer, @test_comp_player)
  end

  def test_comp_player_implements_get_move
    assert_respond_to(@test_comp_player, :get_move)
  end
end
