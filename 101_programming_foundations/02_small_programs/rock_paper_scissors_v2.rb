VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

SHORT_CHOICE_MATRIX = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                        'l' => 'lizard', 'sp' => 'spock' }

RESULT = { 'rock' => { 'rock' => 'tie',
                       'paper' => 'lose',
                       'scissors' => 'win',
                       'lizard' => 'win',
                       'spock' => 'lose' },
           'paper' => { 'rock' => 'win',
                        'paper' => 'tie',
                        'scissors' => 'lose',
                        'lizard' => 'lose',
                        'spock' => 'win' },
           'scissors' => { 'rock' => 'lose',
                           'paper' => 'win',
                           'scissors' => 'tie',
                           'lizard' => 'win',
                           'spock' => 'lose' },
           'lizard' => { 'rock' => 'lose',
                         'paper' => 'win',
                         'scissors' => 'lose',
                         'lizard' => 'tie',
                         'spock' => 'win' },
           'spock' => { 'rock' => 'win',
                        'paper' => 'lose',
                        'scissors' => 'win',
                        'lizard' => 'lose',
                        'spock' => 'tie' } }

def prompt(message)
  puts "=> #{message}"
end

def translate(choice)
  if SHORT_CHOICE_MATRIX.key?(choice)
    SHORT_CHOICE_MATRIX[choice]
  else
    choice
  end
end

def calculate_result(player_choice, computer_choice)
  RESULT[player_choice][computer_choice]
end

prompt("Welcome to the Rock, Paper, Scissors game!")

player_score = 0
computer_score = 0

loop do
  choice = ''

  loop do
    prompt('Please select (r)ock, (p)aper, (sc)issors, (l)izard or (sp)ock')
    choice = translate(gets.chomp)

    break if VALID_CHOICES.include?(choice)
    prompt('Not a valid choice...')
  end

  computer_choice = VALID_CHOICES.sample
  prompt("Your choice is #{choice}; The computer's is #{computer_choice}")

  case calculate_result(choice, computer_choice)
  when 'win'
    prompt('You win!')
    player_score += 1
  when 'lose'
    prompt('You lose!')
    computer_score += 1
  when 'tie'
    prompt("It's a tie!")
  end

  prompt("The score is Player: #{player_score}; Computer: #{computer_score}")

  prompt('Want to play again? (y/n)')
  play_again = gets.chomp

  break unless play_again.start_with?('y')
end
