# frozen_string_literal: false

require_relative './file_handler'
require_relative './text'

# Hangman
class Game
  include FileHandler
  include Text
  attr_reader :max_turns_per_game,
              :turns_left, :letters_guessed

  def initialize(max_turns_per_game)
    @max_turns_per_game = max_turns_per_game
    @turns_left = max_turns_per_game
    @letters_guessed = []
    @secret_word = ' '
  end

  def choose_secret_word(file_name)
    line_number = rand(1..10_000)
    word = get_specific_line(file_name, line_number)

    word = choose_secret_word(file_name) if word.length <= 5 || word.length >= 12

    @secret_word = word
  end

  def correct_guesses
    corrects = Array.new(@secret_word.length)
    corrects = corrects.map { '_' }

    @secret_word.split('').each_with_index do |value, index|
      corrects[index] = value if @letters_guessed.include?(value)
    end

    corrects
  end

  def win?
    corrects = correct_guesses
    @secret_word.split('').each do |value|
      return false unless corrects.include?(value)
    end
    true
  end

  def guessed_correctly?(guess)
    if @secret_word.split('').include?(guess)
      success_output
      0
    else
      1
    end
  end

  def let_user_guess
    prompt_guess(@turns_left)
    current_guess = gets.chomp
    @letters_guessed.push current_guess

    current_guess
  end

  def new_game(dictionary)
    print_instructions
    choose_secret_word(dictionary)
    solved = false

    while @turns_left.positive? && !solved
      current_guess = let_user_guess

      solved = win?

      @turns_left -= guessed_correctly?(current_guess)
      show_correct_letters(correct_guesses, @letters_guessed)
    end
    reveal_word(@secret_word, win)
  end
end

dictionary_file = './google-10000-english.txt'
max_turns = 15

hangman = Game.new(max_turns)
hangman.new_game(dictionary_file)
