#!/usr/bin/env ruby -wKU
# deck_of_cards.rb

require 'pry'

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


deck = Deck.new
#binding.pry
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
p 52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
