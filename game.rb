# frozen_string_literal: false

require_relative './file_handler'

# Hangman
class Game
  include FileHandler
  attr_reader :dictionary_file_path

  def initialize(dictionary)
    @dictionary_file_path = dictionary
  end

  def choose_secret_word
    line_number = rand(1..10_000)
    word = get_specific_line(@dictionary_file_path, line_number)

    word = choose_secret_word if word.length <= 5 || word.length >= 12

    word
  end
end

dictionary_file = './google-10000-english.txt'

puts Game.new(dictionary_file).choose_secret_word
