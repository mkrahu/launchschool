#!/usr/bin/env ruby -wKU
# rps_game.rb

require 'pry'

class History
  attr_accessor :log, :results

  def initialize
    @log = []
    create_results
  end

  def create_results
    @results = Hash.new
    Move::VALUES.each do |value|
      results[value] = { 'win' => 0, 'tie' => 0, 'loss' => 0 }
    end
  end

  def add_result(move, result)
    @log << move.value
    results[move.value][result] += 1
  end
end

class Player
  attr_accessor :move, :name, :history

  def initialize
    set_name
    @history = History.new
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      print "What's your name? "
      n = $stdin.gets.chomp.capitalize
      break unless n.empty?
      puts "Sorry, please provide your name..."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      print "Please choose " \
            "#{Move::VALUES[0..-2].join(', ')} or #{Move::VALUES[-1]}: "
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
    self.move = Move.new(weight_choices.sample)
  end

  def weight_choices
    choices = []
    Move::VALUES.each do |move|
      move_results = history.results[move]
      weight = 3 + (move_results['win'] - move_results['loss'])
      choices += [move] * (weight < 0 ? 0 : weight)
    end
    choices
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  WIN_HASH = {  'rock'     => ['scissors', 'lizard'],
                'paper'    => ['rock', 'spock'],
                'scissors' => ['paper', 'lizard'],
                'lizard'   => ['spock', 'paper'],
                'spock'    => ['scissors', 'rock'] }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other)
    WIN_HASH[@value].include?(other.value)
  end

  def <(other)
    WIN_HASH[other.value].include?(@value)
  end

  def to_s
    @value
  end
end

class RPSRound
  WINNING_SCORE = 3

  attr_accessor :human, :computer, :score, :winner

  def initialize(human, computer)
    @human = human
    @computer = computer
    @score = { human.name => 0, computer.name => 0 }
    @winner = nil
  end

  def display_moves
    system 'clear'
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def calculate_turn
    winner = nil
    if human.move > computer.move
      winner = human.name
    elsif human.move < computer.move
      winner = computer.name
    end
    update_history(winner)
    winner
  end

  def display_results
    turn_winner = calculate_turn
    if turn_winner
      puts "#{turn_winner} won!"
      score[turn_winner] += 1
    else
      puts "It's a tie!"
    end
  end

  def update_history(winner)
    case winner
    when human.name
      human.history.add_result(human.move, 'win')
      computer.history.add_result(computer.move, 'loss')
    when computer.name
      human.history.add_result(human.move, 'loss')
      computer.history.add_result(computer.move, 'win')
    else
      human.history.add_result(human.move, 'tie')
      computer.history.add_result(computer.move, 'tie')
    end
  end

  def display_score
    puts "Score is now #{human.name}: #{score[human.name]}, " \
      "#{computer.name}: #{score[computer.name]}"
  end

  def round_winner?
    score.value?(WINNING_SCORE)
  end

  def round_winner
    score.key(WINNING_SCORE)
  end

  def play
    puts "Best of #{WINNING_SCORE} wins!"
    loop do
      human.choose
      computer.choose
      display_moves
      display_results
      display_score
      break if round_winner?
    end
    self.winner = round_winner
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    system 'clear'
    puts "Welcome to " \
         "#{Move::VALUES[0..-1].map(&:capitalize).join(', ')} #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing " \
         "#{Move::VALUES[0..-1].map(&:capitalize).join(', ')}... Goodbye!"
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
      round.play
      puts "#{round.winner} won the game!"
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
