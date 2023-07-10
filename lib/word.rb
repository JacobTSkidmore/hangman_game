# frozen_string_literal: true

# select word from file and set up the blanks and key
module WordSetup
  def select_word
    contents = File.open('10000_word_dictionary.txt')

    lines = contents.readlines.map do |word|
      word = word.chomp
      word if word.length >= 5 && word.length <= 12
    end

    proper_words = lines.compact

    proper_words[rand(proper_words.length - 1)]
  end

  def blanks(word)
    Array.new(word.length, '_')
  end

  def key(word)
    word.split
  end
end
