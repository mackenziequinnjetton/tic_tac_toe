require 'input_to_string_io'
require 'mover'

require 'minitest/autorun'

class MoverTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_mover = Mover.new
  end

  def teardown
    $stdin.close
    $stdin = STDIN
  end

  def test_make_move
    $stdin = input_to_string_io('b1')
    player = CompPlayer.new
    current_player = 1

    exp = 'a1'

    assert_equal(exp, @test_mover.make_move(player: player, current_player: current_player))
  end
end
