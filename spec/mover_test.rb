require_relative './helpers/input_to_string_io'
require_relative '../lib/mover'

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

  def current_player
    2
  end

  def test_make_move
    $stdin = input_to_string_io('b1')

    exp = 'b1'

    assert_equal(exp, @test_mover.make_move(current_player))
  end
end
