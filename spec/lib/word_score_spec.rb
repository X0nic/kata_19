require 'spec_helper'

describe WordScore do
  subject { described_class.new(base_word: base_word, ending_word: ending_word, words: words) }

  let(:ending_word) { 'bird' }
  let(:words) { Link.new(left_word: base_word, ending_word: ending_word).all_matches }

  context 'with cat' do
    let(:base_word) { 'cat' }

    it 'possible words' do
      expect(subject.possible_words).to start_with "cart", "cats", "cant", "chat", "cast", "bat", "car", "scat"
    end

    it 'cart is top choice for possible words' do
      expect(subject.best_match).to eq 'cart'
    end

    it 'scored words' do
      expect(subject.scores).to include({
        'bat' => 0,
        'car' => 0,
        'cart' => 1,
      })
    end

    it 'scores word of shorter length' do
      expect(subject.score_word('can')).to eq(-1)
    end

    it 'scores word of same length and no matching letters' do
      expect(subject.score_word('cant')).to eq(0)
    end

    it 'scores word of same length and one matching letter' do
      expect(subject.score_word('cart')).to eq(1)
    end

    it 'scores word of same length and two matching letters' do
      expect(subject.score_word('card')).to eq(2)
    end
  end

  context 'with card' do
    let(:base_word) { 'card' }

    it 'possible words' do
      expect(subject.possible_words.count).to eq 23
    end

    it 'bard is top choice for possible words' do
      expect(subject.best_match).to eq 'bard'
    end

    it 'scored words' do
      expect(subject.scores).to include({
        'bard' => 3,
        'curd' => 2,
        'scad' => 1,
      })
    end
  end

  context 'with ending_word' do
    let(:base_word) { ending_word }

    it 'bard is top choice for possible words' do
      expect(subject.best_match).to be_nil
    end
  end

  # context 'with art' do
  #   let(:base_word) { 'art' }
  #   it 'works' do
  #     expect(subject.matches).to eq ["arts", "arty", "cart", "dart", "fart", "hart", "mart", "part", "wart"]
  #   end
  # end
end
