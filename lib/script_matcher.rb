# frozen_string_literal: true

class ScriptMatcher
  def call
    length_hash = compute_hash(file_to_array)
    p matched_words(length_hash)
  end

  private

  def file_to_array
    File.read('dictionary.txt').split.uniq.map(&:downcase)
  end

  def compute_hash(dictionary)
    dictionary.each_with_object({}) do |w, h|
      length = w.size
      (h[length] ||= []) << w if length < 7
    end
  end

  def matched_words(dictionary_hash)
    dictionary_hash[6].select do |w|
      (1..5).any? do |i|
        found?(dictionary_hash[i], w[0, i]) && found?(dictionary_hash[6 - i], w[i..])
      end
    end
  end

  def found?(list, word)
    w = list.bsearch { |w| w >= word }
    w && w == word
  end
end

ScriptMatcher.new.call
