require 'spec_helper'

describe Chain do
  subject { described_class.new(first_word: first_word, last_word: last_word).show }

  let(:first_word) { 'cat' }
  let(:last_word) { 'bird' }

  it 'works' do
    expect(subject).to eq ['cat', 'cart', 'bard', 'bird']
  end
end
