# tic_tac_toe.rb
# Tac Tac Toe Walk-through
# Slightly Larger Programs

# Game Constants
SPACE_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [7, 5, 3]]
FIRST_PLAYER = 'choose'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = SPACE_MARKER }
  new_board
end

def pick_order
  if FIRST_PLAYER == 'choose'
    loop do
      puts "Who should go first this round? (player or computer)"
      whos_turn = gets.chomp
      return whos_turn if ['player', 'computer'].include?(whos_turn)
      puts "Please enter 'computer' or 'user'"
    end
  else
    FIRST_PLAYER
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

# Start Display functions
# rubocop:disable Metrics/AbcSize
def draw_board(brd)
  system 'clear'
  puts "You are X's. Computer is O's"

  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end
# rubocop:enable Metrics/AbcSize

def joinor(arr, punctuation, word='or')
  case arr.length
  when 1
    arr.first
  else
    arr[0..-2].join("#{punctuation} ") + " #{word} #{arr[-1]}"
  end
end

# End Display functions

def empty_spaces(brd)
  brd.keys.select { |key| brd[key] == SPACE_MARKER }
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == SPACE_MARKER }.keys.first
  end
end

# Start Gameplay functions

def player_plays(brd)
  player_choice = ' '
  loop do
    puts "Choose a position to place a piece: " +
         joinor(empty_spaces(brd), ',').to_s
    player_choice = gets.chomp.to_i
    break if empty_spaces(brd).include?(player_choice)
    puts "That wasn't a valid choice..."
  end
  brd[player_choice] = PLAYER_MARKER
end

def computer_plays(brd)
  computer_choice = nil

  # offense first
  WINNING_LINES.each do |line|
    computer_choice = find_at_risk_square(line, brd, COMPUTER_MARKER)
    qbreak if computer_choice
  end

  # defense
  if !computer_choice
    WINNING_LINES.each do |line|
      computer_choice = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if computer_choice
    end
  end

  if !computer_choice && brd[5] == SPACE_MARKER
    computer_choice = 5
  end

  # random if no at risk squares
  if !computer_choice
    computer_choice = empty_spaces(brd).sample
  end

  brd[computer_choice] = COMPUTER_MARKER
end

def play_piece!(brd, player)
  if player == 'player'
    player_plays(brd)
  elsif player == 'computer'
    computer_plays(brd)
  end
end

# End gameplay functions

# Start scoring functions

def board_full?(brd)
  empty_spaces(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |row|
    if brd.values_at(*row).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*row).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def round_won?(brd)
  !!detect_winner(brd)
end

def game_won?(score_hash)
  !!score_hash.key(5)
end

def game_winner(score_hash)
  score_hash.key(5)
end

# End scoring functions

# Start game loop

loop do
  score = { "Player" => 0, "Computer" => 0 }
  loop do
    board = initialize_board
    current_player = pick_order
    loop do
      draw_board(board)
      play_piece!(board, current_player)
      current_player = alternate_player(current_player)

      break if round_won?(board) || board_full?(board)
    end

    draw_board(board)
    if round_won?(board)
      winner = detect_winner(board)
      puts "#{winner} won this round!"
      score[winner] += 1
    elsif board_full?(board)
      puts "This round's a tie!"
    end
    break if game_won?(score)
    puts "The score is Player: #{score['Player']} Computer: #{score['Computer']}"
    puts "Continue next round? (y/n)"
    round_again = gets.chomp
    current_player = FIRST_PLAYER
    break unless round_again.downcase.start_with?('y')
  end

  puts "#{game_winner(score)} won the game!" if game_won?(score)
  puts "Final score: Player: #{score['Player']} Computer: #{score['Computer']}"

  puts "Want to play again? (y/n)"
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
puts "Thanks for playing Tic Tac Toe! Goodbye!"
