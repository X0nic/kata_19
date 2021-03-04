require 'spec_helper'

describe Link do
  subject { described_class.new(left_word: left_word, ending_word: ending_word) }

  let(:left_word) { 'cart' }
  let(:ending_word) { 'bird' }

  it 'right_word' do
    expect(subject.right_word).to eq 'card'
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
