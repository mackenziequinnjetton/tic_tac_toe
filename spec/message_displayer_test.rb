require 'message_displayer'

require 'minitest/autorun'

class MessageDisplayerTest < Minitest::Test
  include InputToStringIo

  def setup
    $stdout = StringIO.new
    @test_message_displayer = MessageDisplayer.new
  end

  def test_welcome_message
    exp = 'Welcome to Tic Tac Toe!'
    act = @test_message_displayer.welcome_message

    assert_equal(exp, act)
  end

  def test_go_first_or_second_first
    $stdin = input_to_string_io('first')

    exp = 1
    act = @test_message_displayer.go_first_or_second

    assert_equal(exp, act)
  end

  def test_go_first_or_second_second
    $stdin = input_to_string_io('second')

    exp = 2
    act = @test_message_displayer.go_first_or_second

    assert_equal(exp, act)
  end

  def test_game_result_winner_p1
    result = :winner_p1

    exp = "Player 1 wins!\n"

    assert_output(exp) { @test_message_displayer.game_result(result) }
  end

  def test_game_result_winner_p2
    result = :winner_p2

    exp = "Player 2 wins!\n"

    assert_output(exp) { @test_message_displayer.game_result(result) }
  end

  def test_game_result_winner_p2
    result = :winner_p2

    exp = "Player 2 wins!\n"

    assert_output(exp) { @test_message_displayer.game_result(result) }
  end

  def test_game_result_draw
    result = :draw

    exp = "The game was a draw. Better luck next time!\n"


    assert_output(exp) { @test_message_displayer.game_result(result) }
  end
end
