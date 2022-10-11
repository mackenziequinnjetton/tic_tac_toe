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

  def test_make_move_human_opponent
    $stdin = input_to_string_io('b1')
    current_player_number = 1
    opponent = HumanPlayer.new
    board = Board.new

    exp = 'b1'
    act = @test_mover.make_move(current_player_number:, player_or_opponent: opponent, board:)

    assert_equal(exp, act)
  end
end
