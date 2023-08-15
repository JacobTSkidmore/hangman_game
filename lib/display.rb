# frozen_string_literal: true

# Text needed for hangman with some interpolation
module Display
  def print_blanks(blanks, lives)
    "#{blanks.join(' ')} | Lives remaining: #{lives}"
  end

  def ask_guess(guessed)
    "Guess a letter a - z, excluding your previous guesses:\n#{guessed}"
  end

  def win_game(word)
    "You won! You guessed the word! The word was #{word.join}."
  end

  def lose_game(word)
    "You did not guess the word. The word was #{word.join}."
  end
end
