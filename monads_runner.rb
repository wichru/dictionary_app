# frozen_string_literal: true

require_relative 'lib/monads_matcher'

matched_words = MonadsMatcher.new('dictionary.txt').call
p matched_words
