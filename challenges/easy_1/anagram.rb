# anagrams.rb

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    possible_anagrams.select do |element| 
      anagram?(element) && !identical?(element)
    end
  end

  private

  def anagram?(possible_anagram)
    possible_anagram.downcase.chars.sort == word.downcase.chars.sort
  end

  def identical?(possible_anagram)
    possible_anagram.downcase == word.downcase
  end
end