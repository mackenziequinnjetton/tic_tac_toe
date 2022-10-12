class MessageDisplayer
  def welcome_message
    'Welcome to Tic Tac Toe!'
  end

  def go_first_or_second
    choice = validate_first_or_second

    return 1 if choice == 'first'

    2
  end

  def game_result(result)
    case result
    when :winner_p1
      puts 'Player 1 wins!'
    when :winner_p2
      puts 'Player 2 wins!'
    else
      puts 'The game was a draw. Better luck next time!'
    end

    result
  end

  private

  def validate_first_or_second
    loop do
      puts 'Would you like to go first or second? Please enter "first" or "second".'
      choice = gets.chomp.downcase

      return choice if Set['first', 'second'].include? choice

      puts 'Your selection was not recognized, please try again.'
    end
  end
end
