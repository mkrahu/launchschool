require 'pry'

SUITS = [ 'H', 'C', 'S', 'D' ]
CARDS = [ 'Ace', 'King', 'Queen', 'Jack', '10', '9',
         '8', '7', '6', '5', '4', '3', '2' ]
VALUES = { 'Ace' => 11, 'King' => 10, 'Queen' => 10, 'Jack' => 10,
           '10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6,
           '5' => 5, '4' => 4, '3' => 3, '2' => 2 }

HANDS = { player: [], dealer: [] }

def shuffle_deck
  deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      deck << [suit, card]
    end
  end
  deck.shuffle!
end

def clear_hands
  HANDS[:player] = []
  HANDS[:dealer] = []
end

def calculate_total(hand)
  cards = []
  
  hand.each do |card|
    cards << card[1]
  end

  total = cards.inject(0) { |sum, card| sum + VALUES[card] }

  if total > 21
    count_aces = cards.count('Ace')
    count_aces.times do
      total -= 10 if total > 21
    end
  end
  total
end

def bust?(hand)
  calculate_total(hand) > 21
end

def deal(player,deck)
  HANDS[player] << deck.pop
end

def display_hand(hand)
  "#{hand.map { |card| card[1] }[0..-2].join(", ")}" + " and #{hand[-1][1]}"
end

def dealer_plays(deck)
  until calculate_total(HANDS[:dealer]) >= 17
    deal(:dealer,deck)
  end
end

def calculate_winner
  if calculate_total(HANDS[:dealer]) < calculate_total(HANDS[:player])
    "Player"
  elsif calculate_total(HANDS[:dealer]) > calculate_total(HANDS[:player])
    "Dealer"
  else
    "Push"
  end
end

def display_winner(winner)
  puts "Dealer had #{display_hand(HANDS[:dealer])}, you had #{display_hand(HANDS[:player])}"
  case winner
    when "Player" 
      puts "You won!"
      puts "Dealer: #{calculate_total(HANDS[:dealer])}, Player: #{calculate_total(HANDS[:player])}"
    when "Dealer" 
      puts "You lost..."
      puts "Dealer: #{calculate_total(HANDS[:dealer])}, Player: #{calculate_total(HANDS[:player])}"
    when "Push" 
      puts "It's a push."
  end
end

loop do
  clear_hands
  deck = shuffle_deck
  2.times do
    deal(:player, deck)
    deal(:dealer, deck)
  end

  loop do
    puts "Dealer has: #{HANDS[:dealer][0][1]} and unknown card"
    puts "You have: #{display_hand(HANDS[:player])}"
    puts "hit or stay?"
    answer = $stdin.gets.chomp.downcase
    break if answer.start_with?('s')
    deal(:player, deck)
    break if bust?(HANDS[:player])
  end

  if bust?(HANDS[:player])
    puts "You busted..."
    puts "#{display_hand(HANDS[:player])} is #{calculate_total(HANDS[:player])}"
  else
    dealer_plays(deck)
    if bust?(HANDS[:dealer])
      puts "Dealer busted... YOU WIN!"
    else
      winner = calculate_winner
      display_winner(winner)
    end
  end
    puts "Play again? (y/n)"
    answer = $stdin.gets.chomp.downcase
    break unless answer.start_with?('y')
end

