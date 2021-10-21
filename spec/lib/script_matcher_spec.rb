# frozen_string_literal: false

require 'spec_helper'

RSpec.describe ::ScriptMatcher do
  subject { described_class.new(path).call }
  let(:path) { 'spec/fixtures/dictionary_test.txt' }
  let(:expected_results) { %w[convex tailor weaver] }

  describe '#call' do
    context 'when path is valid' do
      it 'matched words correctly' do
        expect(subject).to eq expected_results
      end
    end
  end
end
