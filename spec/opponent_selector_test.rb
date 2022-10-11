require 'input_to_string_io'

require 'minitest/autorun'

class OpponentSelectorTest < Minitest::Test
  include InputToStringIo
  def setup
    @test_opponent_selector = OpponentSelector.new
  end

  def test_choose_human_opponent
    $stdin = input_to_string_io('human')

    result = @test_opponent_selector.choose_opponent

    assert_kind_of(Player, result)
  end

  def test_choose_computer_opponent
    $stdin = input_to_string_io('computer')

    result = @test_opponent_selector.choose_opponent

    assert_kind_of(CompPlayer, result)
  end
end
