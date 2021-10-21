# frozen_string_literal: true

module HashHelpers
  extend self

  def hash_by_length(dictionary)
    dictionary.each_with_object({}) do |word, hash|
      word_length = word.length
      (hash[word_length] ||= []) << word if word_length < 7
    end
  end

  # rubocop:disable Style/SlicingWithRange
  def match_words(words_hash)
    words_hash[6].select do |w|
      (1..5).any? do |i|
        found?(words_hash[i], w[0, i]) && found?(words_hash[6 - i], w[i..-1])
      end
    end
  end
  # rubocop:enable Style/SlicingWithRange

  def found?(list, word)
    w = list.bsearch { |w| w >= word }
    w && w == word
  end
end
