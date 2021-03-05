class Words
  def self.run(first_word:, last_word:)
    puts "first word: #{first_word}"
    puts "last word: #{last_word}"

    chain = Chain.new(first_word: first_word, last_word: last_word)

    words = chain.show
    if words.last == last_word
      puts "chain: #{words.join(' -> ')}"
    else
      puts "Could not find ending word #{last_word}. Found #{words.join(' -> ')} instead."
    end
  end
end
