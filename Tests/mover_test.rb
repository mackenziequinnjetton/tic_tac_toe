require './input_to_string_io'
require './mover'

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
    skip 'Not implemented'
  end
end
