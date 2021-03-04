class OrderMatcher
  attr_reader :base_word, :words

  def initialize(base_word:, words:)
    @base_word = base_word
    @words = words

    raise 'words must not be nil' if words == nil
    raise "base_word (#{base_word}) can only accept words with #{base_word.length+1} characters" if words.filter { |word| word.length != base_word.length + 1 }.count > 0
  end

  def matches
    words.filter do |word|
      matched_order = base_word.split('').map { |letter| word.split('').index(letter) }
      next if matched_order.any?{|word| word == nil }

      matched_order == matched_order.sort
    end
  end
end
