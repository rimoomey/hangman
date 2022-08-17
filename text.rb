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

  def show_correct_letters(correct_guesses, all_guesses)
    puts 'Current Progress: '
    puts correct_guesses.join(' ')
    puts ''
    puts 'All letters guessed so far: '
    puts all_guesses.join(', ')
  end

  def reveal_word(secret_word)
    puts "The secret word was '#{secret_word}'"
  end
end
