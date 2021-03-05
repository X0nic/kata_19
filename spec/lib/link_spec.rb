require 'spec_helper'

describe Link do
  subject { described_class.new(left_word: left_word, ending_word: ending_word, dictionary: dictionary) }

  let(:ending_word) { 'bird' }
  let(:dictionary) { Dictionary.new(base_word: left_word) }

  context 'with normal word' do
    let(:left_word) { 'cart' }

    describe 'right_word' do
      it 'returns the next valid word' do
        expect(subject.right_word).to eq 'card'
      end

      it 'never returns the same word twice' do
        subject.right_word

        expect(subject.right_word).to eq 'hart'
      end
    end

    it 'additive_matches' do
      expect(subject.additive_matches).to eq ["caret", "carts", "chart"]
    end

    it 'subtractive_matches' do
      expect(subject.subtractive_matches).to eq ["art", "cat", "car"]
    end

    it 'substitutive_matches' do
      expect(subject.substitutive_matches).to eq ["arts", "arty", "cant", "card", "care", "carp", "cars", "cast", "cats", "char", "chat", "coat", "curt", "czar", "dart", "fart", "hart", "mart", "part", "scar", "scat", "wart"]
    end

    it 'all_matches' do
      expect(subject.all_matches.first).to eq "art"
      expect(subject.all_matches.last).to eq "wart"
      expect(subject.all_matches.count).to eq 28
    end

    it 'word_sections' do
      expect(subject.word_sections).to eq ["art", "crt", "cat", "car"]
    end
  end

  context 'with word having two of same letter' do
    let(:left_word) { 'heroes' }

    describe 'right_word' do
      it 'returns the next valid word' do
        expect(subject.right_word).to eq 'herons'
      end

      it 'word_sections' do
        expect(subject.word_sections).to eq ["eroes", "hroes", "heoes", "heres", "heros", "heroe"]
      end
    end

  end
end
