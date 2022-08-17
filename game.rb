# frozen_string_literal: false

require_relative './file_handler'

class Game
  include FileHandler

  def choose_secret_word(data_file); end
end

hangman = Game.new
puts hangman.get_specific_line('./google-10000-english.txt', 10)
