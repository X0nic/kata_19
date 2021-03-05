class Dictionary
  attr_reader :base_word

  def initialize(base_word:)
    @base_word = base_word

    raise 'base_word cant be nil' if base_word == nil
  end

  def words
    @words ||=  all_words.reject{ |line| line == base_word }
  end

  def all_words
    @all_words ||=  open('words.txt')
      .each_line
      .collect { |line| line.strip }
  end

  def first
    words.first
  end

  def last
    words.last
  end

  def exists?(word)
    all_words.find { |w| w == word }
  end
end
