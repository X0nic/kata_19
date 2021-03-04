class Chain
  attr_reader :first_word, :last_word

  def initialize(first_word:, last_word:)
    @first_word = first_word
    @last_word = last_word
  end

  def show
    [first_word, last_word]
  end
end
