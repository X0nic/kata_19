require 'spec_helper'

describe Dictionary do
  subject { described_class.new(base_word: base_word) }
  let(:base_word) { 'cart' }

  it 'returns first word' do
    expect(subject.first).to eq 'a'
  end

  it 'returns last word' do
    expect(subject.last).to eq 'zygotes'
  end

  it 'has correct count of words' do
    expect(subject.words.count).to eq 64023
  end

  it 'does not contain base word' do
    expect(subject.words).not_to include base_word
  end

  describe '#exists?' do
    it 'for an existing word' do
      expect(subject.exists?('car')).to be_truthy
    end

    it 'for a non-existant word' do
      expect(subject.exists?('adf')).to be_falsey
    end
  end
end
