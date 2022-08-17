# frozen_string_literal: false

require_relative './game'
require_relative './file_handler'
require_relative './text'

dictionary_file = './google-10000-english.txt'
max_turns = 15

hangman = Game.new(max_turns, dictionary_file)

Text.load_prompt
hangman.load_from_yaml if gets.chomp.upcase == 'Y'

hangman.new_game
