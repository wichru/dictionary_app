# frozen_string_literal: true

require_relative 'monads'
require_relative 'hash_helpers'

class MonadsMatcher
  def initialize(path)
    @path = path
  end

  def call
    read_file
      .bind(method(:transfer_to_array))
      .bind(method(:format_array))
      .bind(method(:create_length_hash))
      .bind(method(:extract_words))
  end

  attr_reader :path

  private

  def read_file
    if path.is_a?(String) && Dir[path].any?
      Success(File.read(path))
    else
      Failure('Check your entries. Please provide correct string path.')
    end
  end

  def transfer_to_array(file)
    dictionary_array = file.split

    Success(dictionary_array)
  end

  def format_array(dictionary_array)
    formatted_dictionary = dictionary_array.uniq.map(&:downcase).sort

    Success(formatted_dictionary)
  end

  def create_length_hash(formatted_dictionary)
    hash_by_length = HashHelpers.hash_by_length(formatted_dictionary)

    Success(hash_by_length)
  end

  def extract_words(hash_by_length)
    matched_words = HashHelpers.match_words(hash_by_length)

    Success(matched_words)
  end
end
