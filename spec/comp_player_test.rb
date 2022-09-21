require 'minitest/autorun'

CompPlayer = Struct.new(:foo)

class CompPlayerTest < Minitest::Test
  def test_create_comp_player
    test_comp_player = CompPlayer.new

    assert_instance_of(CompPlayer, test_comp_player)
  end
end
