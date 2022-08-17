# frozen_string_literal: false

# Module for the game's text responses.
module Text
  def print_instructions
    puts '<Instructions go here>'
  end

  def prompt_guess(turn_number)
    puts "You have #{turn_number} turns left."
    puts 'Guess a letter (A-Z):'
  end

  def save_prompt
    puts 'Would you like to save? (Y/N)'
  end

  def success_output
    puts 'You got one!'
    puts ''
  end

  def show_correct_letters(correct_guesses, all_guesses)
    puts 'Current Progress: '
    puts correct_guesses.join(' ')
    puts ''
    puts 'All letters guessed so far: '
    puts all_guesses.join(', ')
  end

  def reveal_word(secret_word, win)
    if win
      puts 'You win!'
    else
      puts "The secret word was '#{secret_word}'"
    end
  end
end
