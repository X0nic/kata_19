class Link
  attr_reader :left_word, :ending_word

  def initialize(left_word:, ending_word:)
    @left_word = left_word
    @ending_word = ending_word
  end

  def words
    @words ||= Dictionary.new(base_word: left_word).words
  end

  def right_word
    WordScore.new(base_word: left_word, ending_word: ending_word, words: all_matches).possible_words.first
  end

  def additive_matches
    a = words.filter { |word| word.length == left_word.length + 1 }
    b = a.filter { |word| word.split('').filter { |letter| left_word.include?(letter) }.count == left_word.length }
    OrderMatcher.new(base_word: left_word, words: b).matches
  end

  def subtractive_matches
    a = words.filter { |word| word.length == left_word.length - 1 }
    word_sections & a
  end

  def substitutive_matches
    word_sections.flat_map do |section|
      a = words.filter { |word| word.length == left_word.length }
      # b = a.filter { |word| word.split('').filter { |letter| left_word.include?(letter) }.count == left_word.length }
      # require 'pry' ; binding.pry
      # OrderMatcher.new(base_word: section, words: b).matches
      OrderMatcher.new(base_word: section, words: a).matches
    end.sort.uniq
  end

  def all_matches
    a = [] + additive_matches + subtractive_matches + substitutive_matches
    a.uniq.sort
  end

  def word_sections
    left_word.split('').map { |letter| left_word.delete(letter) }
  end
end
