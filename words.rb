class Words
  def self.run(first_word:, last_word:)
    puts "first word: #{first_word}"
    puts "last word: #{last_word}"

    chain = Chain.new(first_word: first_word, last_word: last_word)
    puts "chain: #{chain.show.join(' -> ')}"
  end
end
