# twenty_one.rb

require 'pry'

module Hand
  def add_card(card)
    cards << card
  end

  def busted?
    total > 21
  end

  def total
    total = cards.map { |card| Card::VALUES[card.face] }.inject(:+)

    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end
end

class Participant
  include Hand

  attr_accessor :cards, :name

  def initialize
    @cards = []
    @name = set_name
  end

  def show_cards
    cards.map(&:face)[0..-2].join(', ') + " and #{cards.last.face}"
  end

  def discard
    @cards = []
  end
end

class Player < Participant
  def set_name
    name = nil
    print "What is your name? "
    loop do
      name = $stdin.gets.chomp
      break unless name.empty?
      print "We really need your name: "
    end
    self.name = name
  end
end

class Dealer < Participant
  ROBOT_NAMES = ['R2D2', 'Hal', 'Sonny']
  def set_name
    self.name = ROBOT_NAMES.sample
  end

  def initial_show_cards
    "#{cards.first.face} and unknown card"
  end

  def hand_meets_minimum?
    total >= 17
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    shuffle
  end

  def shuffle
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    cards.shuffle!
  end

  def deal
    shuffle if cards.empty?
    cards.pop
  end
end

class Card
  attr_reader :suit, :face
  SUITS = ['H', 'D', 'C', 'S']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen',
           'King', 'Ace']
  VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
             '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10,
             'King' => 10, 'Ace' => 11 }

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def ace?
    face == 'Ace'
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    display_welcome_message
    loop do
      deal_cards
      initial_show_cards
      player_turn
      dealer_turn unless player.busted?
      show_cards unless someone_busted?
      show_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  def play_again?
    answer = nil
    puts "Would you like to play again? (y/n)"
    loop do
      answer = $stdin.gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Not a valid choice..."
    end
    answer == 'y'
  end

  def reset
    player.discard
    dealer.discard
    clear
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    clear
    puts "Hi #{player.name}! Welcome to the Twenty One game!"
    puts "Here's the first deal!"
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty One! Goodbye!"
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  def initial_show_cards
    puts "#{dealer.name} has: #{dealer.initial_show_cards}"
    puts "#{player.name} has: #{player.show_cards}"
  end

  def show_cards
    puts "#{dealer.name} has: #{dealer.show_cards}"
    puts "#{player.name} has: #{player.show_cards}"
  end

  def player_turn
    name = player.name
    loop do
      print "#{name}, would you like to hit or stay? "
      answer = $stdin.gets.chomp
      break if answer.start_with?('s')

      player_hits
      puts "#{name} now has: #{player.show_cards}"
      if player.busted?
        puts "#{name} busted!"
        break
      end
    end
  end

  def player_hits
    puts "#{name} hits!"
    player.add_card(deck.deal)
  end

  def dealer_turn
    name = dealer.name
    puts "#{name}'s turn..."
    puts "#{name} has: #{dealer.show_cards}"
    loop do
      break if dealer.hand_meets_minimum?
      sleep 1
      dealer_hits
      puts "#{name} now has: #{dealer.show_cards}"
      break if dealer.busted?
    end
    display_dealer_result
  end

  def dealer_hits
    puts "#{name} hits!"
    dealer.add_card(deck.deal)
  end

  def display_dealer_result
    if dealer.busted?
      puts "#{dealer.name} busted!"
    else
      puts "#{dealer.name} stays!"
    end
    sleep 1
  end

  def someone_busted?
    player.busted? || dealer.busted?
  end

  def show_result
    winner = calculate_winner
    if winner
      puts "#{winner.name} won!"
    else
      put "It's a push..."
    end
  end

  def calculate_winner
    if player.total > dealer.total || dealer.busted?
      player
    elsif dealer.total > player.total || player.busted?
      dealer
    end
  end
end

Game.new.start
