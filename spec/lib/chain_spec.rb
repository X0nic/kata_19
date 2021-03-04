require 'spec_helper'

describe Chain do
  subject { described_class.new(first_word: first_word, last_word: last_word) }

  let(:first_word) { 'cat' }
  let(:last_word) { 'bird' }

  it 'show' do
    expect(subject.show).to eq ['cat', 'cart', 'card', 'bard', 'bird']
  end

  it 'next_words' do
    expect(subject.next_words(first_word)).to eq ['cart', 'card', 'bard', 'bird']
  end
end
