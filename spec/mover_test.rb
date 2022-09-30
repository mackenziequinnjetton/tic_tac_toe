require 'input_to_string_io'
require 'mover'

require 'minitest/autorun'

class MoverTest < Minitest::Test
  include InputToStringIo

  def setup
    @test_mover = Mover.new
    $stdout = StringIO.new
  end

  def teardown
    $stdin.close
    $stdin = STDIN
  end

  def test_make_move
    $stdin = input_to_string_io('b1')
    current_player = 1

    exp = 'b1'

    assert_equal(exp, @test_mover.make_move(current_player))
  end
end
