class WordScore
  attr_reader :base_word, :ending_word, :words

  def initialize(base_word:, ending_word:, words:)
    @base_word = base_word
    @ending_word = ending_word
    @words = words
  end

  def best_match
    return if base_word == ending_word

    possible_words.first
  end

  def possible_words
    @possible_words ||= Hash[ scores.sort_by { |word, score| -score } ].keys
  end

  def scores
    words.each_with_object({}) do |word, acc|
      score = score_word(word)
      acc[word] = score
    end
  end

  def score_word(word)
    score = word.split('').map.with_index { |letter, index| letter == ending_word.split('')[index] ? 1 : 0 }.sum
    score -= 1 if word.length != ending_word.length

    score
  end
end
