# frozen_string_literal: true

require 'pry'

class ScriptMatcher
  def initialize(path)
    @path = path
  end

  def call
    length_hash = compute_hash(file_to_array)
    matched_words(length_hash)
  end

  attr_reader :path

  private

  def file_to_array
    File.read(path).split.uniq.map(&:downcase).sort
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
