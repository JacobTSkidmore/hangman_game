# frozen-string-literal: true

require_relative 'display'

# condense game logic into one file
module GameLogic
  include Display
  def get_guess(guessed)
    puts ask_guess(guessed)
    guess = gets.chomp.downcase
    return guess unless guessed.include?(guess)

    puts 'That was already guessed'
    get_guess(guessed)
  end

  def correct?(guess, key, blanks)
    key.include?(guess) && !blanks.include?(guess)
  end

  def fill_index(guess, key, blanks)
    indices = key.each_with_index.select { |let, index| let == guess }.map(&:last) # rubocop:disable Lint/UnusedBlockArgument
    indices.each do |index|
      blanks[index] = guess
    end
  end

  def test(guess, key, blanks)
    if correct?(guess, key, blanks)
      fill_index(guess, key, blanks)
    else
      1
    end
  end

  def game_over?(key, blanks, lives)
    if key == blanks
      puts win_game(key)
      true
    elsif lives.zero?
      puts lose_game(key)
      true
    else
      false
    end
  end
end
