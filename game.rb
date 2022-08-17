# frozen_string_literal: false

require_relative './file_handler'
require_relative './text'

# Hangman
class Game
  include FileHandler
  include Text
  attr_reader :dictionary_file_path, :max_turns_per_game,
              :turns_left, :letters_guessed

  def initialize(dictionary, max_turns_per_game)
    @dictionary_file_path = dictionary
    @max_turns_per_game = max_turns_per_game
    @turns_left = max_turns_per_game
    @letters_guessed = []
  end

  def choose_secret_word
    line_number = rand(1..10_000)
    word = get_specific_line(@dictionary_file_path, line_number)

    word = choose_secret_word if word.length <= 5 || word.length >= 12

    word
  end

  def correct_guesses(secret_word)
    corrects = Array.new(secret_word.length)
    corrects = corrects.map { '_' }

    secret_word.split('').each_with_index do |value, index|
      corrects[index] = value if @letters_guessed.include?(value)
    end

    corrects
  end

  def win?(secret_word, correct_guesses)
    secret_word.split('').each do |value|
      return false unless correct_guesses.include?(value)
    end
    true
  end

  def guessed_correctly?(secret_word, guess)
    if secret_word.split('').include?(guess)
      success_output
      0
    else
      1
    end
  end

  def new_game
    print_instructions
    secret_word = choose_secret_word
    win = false

    while @turns_left.positive? && !win
      prompt_guess(@turns_left)
      current_guess = gets.chomp
      @letters_guessed.push current_guess

      win = win?(secret_word, correct_guesses(secret_word))

      @turns_left -= guessed_correctly?(secret_word, current_guess)
      show_correct_letters(correct_guesses(secret_word), @letters_guessed)
    end
    reveal_word(secret_word, win)
  end
end

dictionary_file = './google-10000-english.txt'
max_turns = 15

hangman = Game.new(dictionary_file, max_turns)
hangman.new_game
