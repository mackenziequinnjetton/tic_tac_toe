require 'computer_opponent'
require 'human_opponent'
require 'set'

class OpponentSelector
  def initialize; end

  def choose_opponent
    instantiate_opponent validate_opponent_selection
  end

  private

  def validate_opponent_selection
    opponent_selection = nil

    loop do
      opponent_selection = gather_opponent_selection
      break if Set['human', 'computer'].include? opponent_selection

      puts 'Your selection was not recognized, please try again.'
    end

    opponent_selection
  end

  def gather_opponent_selection
    puts 'Would you like to play against a human or a computer opponent? \
          Please enter "human" or "computer".'
    gets.chomp.downcase
  end

  def instantiate_opponent(opponent_selection)
    if opponent_selection == 'human'
      HumanOpponent.new
    else
      ComputerOpponent.new
    end
  end
end
