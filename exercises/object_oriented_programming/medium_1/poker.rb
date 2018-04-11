#!/usr/bin/env ruby -wKU
# poker.rb

class Card
  include Comparable

  RANK_VALUE = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7,
                 8 => 8, 9 => 9, 10 => 10, 'Jack' => 11, 'Queen' => 12,
                 'King' => 13, 'Ace' => 14 }
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    RANK_VALUE.fetch(rank, rank)
  end

  def <=>(other)
    self.value <=> other.value
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    shuffle_cards
  end

  def draw
    shuffle_cards if cards.empty?
    cards.pop
  end

  private
  attr_accessor :cards

  def shuffle_cards
    deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    self.cards = deck.shuffle
  end
end


class PokerHand
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  attr_reader :hand

  def royal_flush?
    high_card = get_ranks.max_by { |rank| Card::RANK_VALUE[rank] }
    straight_flush? && high_card == 'Ace' 
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    ranks_count_hash = get_ranks_count
    ranks_count_hash.values.count(4) == 1
  end

  def full_house?
    ranks_count_hash = get_ranks_count
    ranks_count_hash.values.min > 1
  end

  def flush?
    hand.all? { |card| hand.first.suit == card.suit }
  end

  def straight?
    ranks = get_ranks
    consecutive?(ranks)
  end

  def three_of_a_kind?
    ranks_count_hash = get_ranks_count
    ranks_count_hash.values.count(3) == 1
  end

  def two_pair?
    ranks_count_hash = get_ranks_count
    ranks_count_hash.values.count(2) == 2
  end

  def pair?
    ranks_count_hash = get_ranks_count
    ranks_count_hash.values.count(2) == 1
  end

  def get_ranks_count
    ranks = Hash.new(0)
    hand.each { |card| ranks[card.rank] += 1 }
    ranks
  end

  def get_ranks
    hand.map { |card| card.rank }
  end

  def consecutive?(arr)
    rank_values = arr.map { |rank| Card::RANK_VALUE[rank] }.sort
    rank_values.each_with_index do |a, index|
      return !(rank_values[index + 1]) if rank_values[index] + 1 != rank_values[index + 1]
    end
  end

end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts "Royal Flush: #{hand.evaluate == 'Royal flush'}"

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts "Straight Flush: #{hand.evaluate == 'Straight flush'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Four of a kind: #{hand.evaluate == 'Four of a kind'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Full house: #{hand.evaluate == 'Full house'}"

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts "Flush: #{hand.evaluate == 'Flush'}"

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts "Straight: #{hand.evaluate == 'Straight'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts "Three of a kind: #{hand.evaluate == 'Three of a kind'}"

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Two Pair: #{hand.evaluate == 'Two pair'}"

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Pair: #{hand.evaluate == 'Pair'}"

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts "High Card: #{hand.evaluate == 'High card'}"