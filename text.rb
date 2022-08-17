# frozen_string_literal: false

# Module for the game's text responses.
module Text
  def instructions
    puts '<Instructions go here>'
  end

  def prompt_guess(turn_number, max_turns)
    puts "This is turn ##{turn_number} out of #{max_turns}."
    puts 'Guess a letter (A-Z):'
  end
end
