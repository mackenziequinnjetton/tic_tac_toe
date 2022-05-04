require './mover'

require 'minitest/autorun'

class MoverTest < Minitest::Test
  def setup
    @test_mover = Mover.new
  end

  def teardown
    # Do nothing
  end

  def test_make_move
    skip 'Not implemented'
  end
end
