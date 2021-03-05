class Chain
  attr_reader :first_word, :last_word

  def initialize(first_word:, last_word:)
    @first_word = first_word
    @last_word = last_word
  end

  def dictionary
    @dictionary ||= Dictionary.new(base_word: first_word)
  end

  def show
    raise "Could not find word: '#{first_word}'" unless dictionary.exists?(first_word)
    raise "Could not find word: '#{last_word}'" unless dictionary.exists?(last_word)

    [first_word] + next_words(first_word)
  end

  def next_words(word)
    next_word = get_next_word(word)

    return [ last_word ] if next_word == last_word
    return [] if next_word == nil

    [ next_word ] + next_words(next_word)
  end

  def get_next_word(word)
    Link.new(left_word: word, ending_word: last_word, dictionary: dictionary).right_word
  end
end
