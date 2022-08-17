# frozen_string_literal: false

require_relative './file_handler'
require_relative './text.rb'

# Hangman
class Game
  include FileHandler
  include Text
  attr_reader :dictionary_file_path, :max_turns_per_game

  def initialize(dictionary, max_turns_per_game)
    @dictionary_file_path = dictionary
    @max_turns_per_game = max_turns_per_game
  end

  def choose_secret_word
    line_number = rand(1..10_000)
    word = get_specific_line(@dictionary_file_path, line_number)

    word = choose_secret_word if word.length <= 5 || word.length >= 12

    word
  end

  def new_game
    instructions
    secret_word = choose_secret_word
    guess = ''

    turn = 1

    until turn > @max_turns_per_game
      prompt_guess(turn, @max_turns_per_game)
      guess = gets.chomp
      turn += 1
    end
  end
end

dictionary_file = './google-10000-english.txt'
max_turns = 10

hangman = Game.new(dictionary_file, max_turns)
hangman.new_game
