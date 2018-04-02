#!/usr/bin/env ruby -wKU
# rps_game.rb

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      print "What's your name? "
      n = $stdin.gets.chomp
      break unless n.empty?
      puts "Sorry, please provide your name..."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      print "Please choose #{Move::VALUES[0..-2].join(', ')} or #{Move::VALUES[-1]}: "
      choice = $stdin.gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice..."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = [ 'rock', 'paper', 'scissors', 'lizard', 'spock' ]
  WIN_HASH = {  'rock'     => ['scissors', 'lizard'],
                'paper'    => ['rock', 'spock'],
                'scissors' => ['paper', 'lizard'],
                'lizard'   => ['spock', 'paper'],
                'spock'    => ['scissors', 'rock'] }

  def initialize(value)
    @value = value
  end

  def >(other)
    WIN_HASH[@value].include?(other)
  end

  def <(other)
    ! WIN_HASH[@value].include?(other)
  end

  def to_s
    @value
  end
end

class RPSRound
  WINNING_SCORE = 3

  attr_accessor :human, :computer, :score

  def initialize(human, computer)
    @human = human
    @computer = computer
    @score = { human.name => 0, computer.name => 0 }
  end

  def display_moves
    system 'clear'
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def calculate_turn
    if human.move > computer.move
      human.name
    elsif human.move < computer.move
      computer.name
    end
  end

  def display_winner
    turn_winner = calculate_turn
    if turn_winner
      puts "#{turn_winner} won!"
      score[turn_winner] += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "Score is now #{human.name}: #{score[human.name]}, " \
      "#{computer.name}: #{score[computer.name]}"
  end

  def winner?
    score.value?(WINNING_SCORE)
  end

  def winner
    score.key(WINNING_SCORE)
  end

  def play
    puts "Best of #{WINNING_SCORE} wins!"
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break if winner?
    end
    winner
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES[0..-2].join(', ')} or #{Move::VALUES[-1]} #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock... Goodbye!"
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again? (y/n) "
      answer = $stdin.gets.chomp
      break if ['y', 'n'].include? answer
      puts "Invalid entry..."
    end
    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    display_welcome_message
    loop do
      round = RPSRound.new(human, computer)
      winner = round.play
      puts "#{winner} won the game!"
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
