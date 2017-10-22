# rock_paper_scissors.rb
# Rock, Paper, Scissors program from Lesson 2: Small Programs
# Small Problems exercises from LaunchSchool

VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ACRONYMS = %w(r p sc l sp)

WIN_HASH = {  'rock'     => ['scissors', 'lizard'],
              'paper'    => ['rock', 'spock'],
              'scissors' => ['paper', 'lizard'],
              'lizard'   => ['spock', 'paper'],
              'spock'    => ['scissors', 'rock'] }

ACRONYM_HASH = {  'r'   => 'rock',
                  'p'   => 'paper',
                  'sc'  => 'scissors',
                  'l'   => 'lizard',
                  'sp'  => 'spock' }

def prompt(message)
  puts "> #{message}"
end

def win?(first, second)
  WIN_HASH[first].include?(second)
end


prompt('Welcome to the Rock, Paper, Scissors, Lizard, Spock game!')
prompt('We will play to see who gets to five first!')

player_score = 0
computer_score = 0

loop do
  prompt("Please enter (r)ock, (p)aper, (sc)issors, (l)zard or (sp)ock:")
  
  choice = ''

  loop do
    choice = $stdin.gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_ACRONYMS.include?(choice)
      choice = ACRONYM_HASH[choice]
      break
    else
      prompt('Please enter a valid choice...')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You picked #{choice}. The computer picked #{computer_choice}")
  if win?(choice, computer_choice)
    prompt('You won this round!')
    player_score += 1
  elsif win?(computer_choice, choice)
    prompt('Computer won this round!')
    computer_score += 1
  else
    prompt('You tied this round!')
  end


  if player_score < 5 && computer_score < 5
    prompt("Your score is now: #{player_score}")  
    prompt("Computer score is now: #{computer_score}")
    next
  elsif player_score == 5
    prompt("You won the game!")
  else
    prompt("Computer won the game!")
  end

  prompt('Do you want to play again?')
  play_again = $stdin.gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt('Thanks for playing, come again!')
