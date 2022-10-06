require 'minitest/autorun'
require_relative '../lib/comp_player'

class CompPlayerTest < Minitest::Test
  def setup
    @test_comp_player = CompPlayer.new
  end

  def test_comp_player_gets_top_left_move
    current_player = 1

    assert_equal('a1', @test_comp_player.get_move(current_player: 1))
  end

  def test_incomplete_message
    exp = 'We\'re sorry, computer player support is not fully implemented yet. ' \
          'Please try again later!'
    act = @test_comp_player.incomplete_message

    assert_equal(exp, act)
  end
end
