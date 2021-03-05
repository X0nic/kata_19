class Dictionary
  attr_reader :base_word, :words

  def initialize(base_word:)
    @base_word = base_word
    @removed_words = []

    raise 'base_word cant be nil' if base_word == nil
    remove_word_from_use(base_word)
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

  def words_with_length(length)
    words.filter { |word| word.length == length }
  end

  def exists?(word)
    all_words.find { |w| w == word }
  end

  def remove_word_from_use(word)
    @removed_words += [word]

    @words =  all_words.reject{ |line| @removed_words.include?(line) }
  end
end
