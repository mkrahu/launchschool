require 'pry'

# configuration
PLAY_TO = 21
DEALER_MUST_GET = 17
ROUNDS_TO_WIN = 5

# card constants
SUITS = ['H', 'C', 'S', 'D']
CARDS = ['Ace', 'King', 'Queen', 'Jack', '10', '9',
         '8', '7', '6', '5', '4', '3', '2']
VALUES = { 'Ace' => 11, 'King' => 10, 'Queen' => 10, 'Jack' => 10,
           '10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6,
           '5' => 5, '4' => 4, '3' => 3, '2' => 2 }

def shuffle_deck
  SUITS.product(CARDS).shuffle
end

def calculate_total(hand)
  cards = []

  hand.each do |card|
    cards << card[1]
  end

  total = cards.inject(0) { |sum, card| sum + VALUES[card] }

  if total > PLAY_TO
    count_aces = cards.count('Ace')
    count_aces.times do
      total -= 10 if total > PLAY_TO
    end
  end
  total
end

def bust?(total)
  total > PLAY_TO
end

def deal(hand, deck)
  hand << deck.pop
end

def display_hand(hand)
  hand.map { |card| card[1] }[0..-2].join(', ') + " and #{hand[-1][1]}"
end

def dealer_plays(dealer_hand, deck)
  puts "Dealers turn..."
  puts "Dealer has #{display_hand(dealer_hand)}"
  sleep(2)
  until calculate_total(dealer_hand) >= DEALER_MUST_GET
    puts "Dealer hits!"
    deal(dealer_hand, deck)
    puts "Dealer now has #{display_hand(dealer_hand)}"
    sleep(2)
  end
end

def calculate_winner(player_total, dealer_total)
  if player_total > PLAY_TO
    :player_bust
  elsif dealer_total > PLAY_TO
    :dealer_bust
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :push
  end
end

def display_round_winner(winner, player_total, dealer_total)
  case winner
  when :player_bust
    sleep(1)
    puts "You busted..."
  when :dealer_bust
    puts "The dealer busted!"
  when :player
    puts "You won!"
  when :dealer
    puts "You lost..."
  when :push
    puts "It's a push."
  end
  puts "Dealer had #{dealer_total}"
  puts "You had #{player_total}"
end

def display_game_winner(player_score, dealer_score)
  if player_score >= ROUNDS_TO_WIN
    puts "You won the game!"
  else
    puts "You lost the game..."
  end
  puts "Final score is player: #{player_score}, dealer: #{dealer_score}"
end

def play_again?
  puts "Play again? (y/n)"
  answer = $stdin.gets.chomp.downcase
  answer.start_with?('y')
end

loop do
  puts "Welcome to the Twenty-one game!"
  player_score = 0
  dealer_score = 0
  loop do
    puts "Next round" unless dealer_score.zero? && player_score.zero?
    dealer_hand = []
    player_hand = []

    deck = shuffle_deck

    # inital deal
    2.times do
      deal(player_hand, deck)
      deal(dealer_hand, deck)
    end

    # players turn
    player_total = nil
    loop do
      puts "Dealer has: #{dealer_hand[0][1]} and unknown card"
      puts "You have: #{display_hand(player_hand)}"
      puts "hit or stay?"
      answer = $stdin.gets.chomp.downcase
      break if answer.start_with?('s')
      deal(player_hand, deck)
      player_total = calculate_total(player_hand)
      break if bust?(player_total)
    end
    player_total ||= calculate_total(player_hand)

    # dealers turn
    dealer_plays(dealer_hand, deck) unless bust?(player_total)
    dealer_total = calculate_total(dealer_hand)
    puts "Dealer stays..." unless bust?(dealer_total) || bust?(player_total)
    sleep(1)

    # display round winner
    winner = calculate_winner(player_total, dealer_total)
    display_round_winner(winner, player_total, dealer_total)

    # update score and display
    player_score += 1 if [:player, :dealer_bust].include?(winner)
    dealer_score += 1 if [:dealer, :player_bust].include?(winner)
    puts "The score is now dealer: #{dealer_score}, player: #{player_score}"
    sleep(2)
    puts
    break if player_score >= ROUNDS_TO_WIN || dealer_score >= ROUNDS_TO_WIN
  end

  display_game_winner(player_score, dealer_score)
  break unless play_again?
end
