# frozen-string-literal: true

require_relative 'word'

# Game class meant for everything to run within and be saveable
class Game
  include WordSetup
  attr_accessor :guessed, :blanks
  attr_reader :key

  def initialize
    @game_word = select_word
    @blanks = blanks(@game_word)
    @key = key(@game_word)
    @guessed = []
  end
end
