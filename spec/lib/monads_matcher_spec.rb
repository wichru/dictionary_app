# frozen_string_literal: false

require 'spec_helper'

RSpec.describe ::MonadsMatcher do
  subject { described_class.new(path).call }

  describe '#call' do
    context 'when path is valid' do
      let(:path) { 'spec/fixtures/dictionary_test.txt' }
      let(:expected_results) { %w[convex tailor weaver] }

      it 'matched words correctly' do
        expect(subject).to eq Success(expected_results)
      end
    end

    context 'when path is invalid' do
      let(:path) { 'some_path' }

      it 'raise runtime error' do
        expect(subject).to eq Failure('Check your entries. Please provide correct string path.')
      end
    end
  end
end
