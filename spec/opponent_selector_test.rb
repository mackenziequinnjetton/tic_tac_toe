require 'input_to_string_io'

require 'minitest/autorun'

class OpponentSelectorTest < Minitest::Test
  include InputToStringIo
  def setup
    @test_game = Game.new
  end

  def test_choose_human_opponent
    $stdin = input_to_string_io('human')

    result = @test_game.opponent_selector.choose_opponent

    assert_kind_of(HumanOpponent, result)
  end

  def test_choose_computer_opponent
    $stdin = input_to_string_io('computer')

    result = @test_game.opponent_selector.choose_opponent

    assert_kind_of(ComputerOpponent, result)
  end
end
