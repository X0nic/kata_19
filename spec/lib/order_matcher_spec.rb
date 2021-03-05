require 'spec_helper'

describe OrderMatcher do
  subject { described_class.new(base_word: base_word, words: words) }

  let(:words) do
    Dictionary.new(base_word: base_word).words_with_length(base_word.length + 1)
  end

  context 'with cat' do
    let(:base_word) { 'cat' }
    it 'works' do
      expect(subject.matches).to eq ["cant", "cart", "cast", "cats", "chat", "coat", "scat"]
    end
  end

  context 'with art' do
    let(:base_word) { 'art' }
    it 'works' do
      expect(subject.matches).to eq ["arts", "arty", "cart", "dart", "fart", "hart", "mart", "part", "wart"]
    end
  end

  context 'with heroes' do
    let(:base_word) { 'heroes' }
    it 'return empty array' do
      expect(subject.matches).to eq []
    end
  end
end
