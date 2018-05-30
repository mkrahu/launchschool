class Phrase
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def word_count
    count = Hash.new(0)
    words.scan(/\b[\w']+\b/) { |word| count[word.downcase] += 1 }
    count
  end
end