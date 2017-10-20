# rock_paper_scissors.rb
# Rock, Paper, Scissors program from Lesson 2: Small Programs
# Small Problems exercises from LaunchSchool

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "> #{message}"
end

def display_results(player, computer)
  if    (player == 'rock' && computer == 'scissors') ||
        (player == 'paper' && computer == 'rock') ||
        (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt('You tied!')
  end
end

prompt('Welcome to the Rock, Paper, Scissors game!')

loop do
  prompt("Please enter #{VALID_CHOICES.join(', ')}")
  choice = ''
  loop do
    choice = $stdin.gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt('Please enter a valid choice...')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You picked #{choice}. The computer picked #{computer_choice}")
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  play_again = $stdin.gets.chomp
  break unless play_again.downcase.start_with?('y')
end
prompt('Thanks for playing, come again!')
