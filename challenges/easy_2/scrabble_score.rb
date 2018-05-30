class Scrabble
  VALUES = [ 1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3,
             1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10]
  SCORES = ('a'..'z').zip(VALUES).to_h

  attr_reader :word

  def self.score(word)
    self.new(word).score
  end

  def initialize(word)
    @word = word

  end

  def score
    return 0 if word.nil? || word.split.empty?

    word.chars.reduce(0) { |sum, char| sum + SCORES.fetch(char.downcase) }
  end
end