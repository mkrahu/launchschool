#!/usr/bin/env ruby -wKU
# rps_game.rb 

class Player
  attr_accessor :move, :name

  def initialize(player_type= :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def choose
    if human?
      choice = nil
      loop do
        print "Please choose rock, paper, or scissors: "
        choice = $stdin.gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalid choice..."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end

  def set_name
    if human?
      n = ''
      loop do
        print "What's your name? "
        n = $stdin.gets.chomp
        break unless n.empty?
        puts "Sorry, please provide your name..."
      end
      self.name = n
    else
      self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number'].sample
    end
  end
end

class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)
  

end


class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors... Goodbye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    end
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again? (y/n) "
      answer = $stdin.gets.chomp
      break if ['y','n'].include? answer
      puts "Invalid entry..."
    end
      return true if answer == 'y'
      return false
  end


  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
