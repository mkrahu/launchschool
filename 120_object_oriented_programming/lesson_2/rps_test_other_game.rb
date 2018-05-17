class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard' ]

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end
end

class Rock < Move
  def >(other_value)
    other_value.class == Scissors ||
      other_value.class == Lizard
  end
end

class Scissors < Move
  def >(other_value)
    other_value.class == Paper ||
      other_value.class == Lizard
  end
end

class Paper < Move
  def >(other_value)
    other_value.class == Rock ||
      other_value.class == Spock
  end
end

class Spock < Move
  def >(other_value)
    other_value.class == Rock ||
      other_value.class == Scissors
  end
end

class Lizard < Move
  def >(other_value)
    other_value.class == Spock||
      other_value.class == Paper
  end
end

class Player
  attr_accessor :move, :name, :chosen_moves, :games_won

  def initialize
    set_name
    @chosen_moves = Array.new
    @games_won = 0
  end

  def create_move(selection)
    case selection
    when 'rock'
      self.move = Rock.new('rock')
    when 'paper'
      self.move = Paper.new('paper')
    when 'scissors'
      self.move = Scissors.new('scissors')
    when 'spock'
      self.move = Spock.new('spock')
    when 'lizard'
      self.move = Lizard.new('lizard')
    end
  end
end

class Human < Player
  def set_name
    puts "What's your name?"
    response = nil
    loop do
      response = gets.chomp
      break if response != ''
      puts "You must enter a name."
    end
    self.name = response
  end

  def choose
    choice = nil
    puts "Choose #{Move::VALUES.join(', ')}."
    loop do
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "You must choose rock, paper, scissors, spock, lizard."
    end
    chosen_moves << create_move(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'R2D2', 'Mr. Computer'].sample
  end

  def choose
    # create_move(Move::VALUES.sample)
    find_most_common_move()
  end

  def find_most_common_move(human_moves_history)
    human_moves_history.max
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def who_won?
    if human.move > computer.move
      human.games_won += 1
    elsif computer.move > human.move
      computer.games_won += 1
    end
  end

  def display_score
    puts "Current Score"
    puts "#{human.name}: #{human.games_won}"
    puts "#{computer.name}: #{computer.games_won}"
    puts "-------------"
  end

  def three_wins?
    human.games_won == 3 || computer.games_won == 3
  end

  def display_three_wins
    if human.games_won == 3
      puts "#{human.name} has won 3 games!"
    elsif computer.games_won == 3
      puts "#{computer.name} has won 3 games!"
    end
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end

    sleep(2)
    system 'clear'
  end

  def display_welcome_message
    sleep(0.5)
    system 'clear'
    puts "Hello, #{human.name}!"
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
    puts "First player to win 3 games will be the champ."
    puts "-------------"
    display_score
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Goodbye!"
  end

  def show_game_history
    human.chosen_moves.each_with_index do |action, index|
      puts "In challenge #{index + 1}:"
      puts "==> #{human.name} chose #{action}."
      puts "==> #{computer.name} chose #{computer.chosen_moves[index]}."
    end
  end

  def review_game_history?
    answer = nil
    puts "Would you like to see the game history so far? (y/n)"
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "You must enter 'y' or 'n'."
    end

    show_game_history if answer == 'y'
  end

  def play_again?
    answer = nil
    puts "Do you want to play again? (y/n)"

    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "You must enter 'y' or 'n'."
    end

    if answer == 'y'
      system 'clear'
      reset_scores
      display_score
      return true
    elsif answer == 'n'
      return false
    end
  end

  def reset_scores
    human.games_won = 0
    computer.games_won = 0
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      who_won?
      display_winner
      display_score
      if three_wins?
        display_three_wins
        review_game_history?
        break unless play_again?
      end
    end
    display_goodbye_message
  end
end

RPSGame.new.play