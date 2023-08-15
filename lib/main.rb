# frozen_string_literal: true

require_relative 'word'
require_relative 'display'
require_relative 'game'

def play_game
  game = Game.new
  game.round
end
play_game
