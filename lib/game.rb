# frozen-string-literal: true

require_relative 'word'
require_relative 'display'
require_relative 'game_logic'

# Game class meant for everything to run within and be saveable
class Game
  include Display
  include GameLogic
  attr_accessor :guessed, :blanks
  attr_reader :key, :name

  def initialize
    @game_word = Word.new
    @blanks = @game_word.blank_array
    @key = @game_word.key_array
    @guessed = []
  end

  def round(lives = 6)
    puts print_blanks(blanks, lives)
    guessed << get_guess(guessed)
    if test(guessed.last, key, blanks) == 1
      lives -= 1
    end
    round(lives) unless game_over?(key, blanks, lives) == true
  end
end
