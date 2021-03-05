require 'spec_helper'

describe Chain do
  describe 'show' do
    subject { described_class.new(first_word: first_word, last_word: last_word).show }

    context 'valid first and last words' do
      let(:first_word) { 'cat' }
      let(:last_word) { 'bird' }

      it 'displays path' do
        expect(subject).to eq ['cat', 'cart', 'card', 'bard', 'bird']
      end

      describe 'next_words' do
        subject { described_class.new(first_word: first_word, last_word: last_word).next_words(first_word) }

        it 'displays the rest of the chain except first word' do
          expect(subject).to eq ['cart', 'card', 'bard', 'bird']
        end
      end
    end

    context 'invalid first word' do
      let(:first_word) { 'catz' }
      let(:last_word) { 'bird' }

      it 'displays error' do
        expect { subject }.to raise_error("Could not find word: 'catz'")
      end
    end

    context 'invalid last word' do
      let(:first_word) { 'cat' }
      let(:last_word) { 'birdz' }

      it 'displays error' do
        expect { subject }.to raise_error("Could not find word: 'birdz'")
      end
    end
  end
end
