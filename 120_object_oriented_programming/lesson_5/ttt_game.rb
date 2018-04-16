# ttt_game.rb

require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]
  
  def initialize
    @squares = Hash.new
    reset
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  def get_square_at(square)
    @squares[square]
  end

  def set_square_at(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end


  def detect_winner
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def display_board
    system 'clear'
    puts "You're a #{HUMAN_MARKER}. Computer is a #{COMPUTER_MARKER}"
    puts "     |     |     "
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.
      get_square_at(3)}  "
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.
      get_square_at(6)}  "
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.
      get_square_at(9)}  "
    puts "     |     |     "
  end

  def human_moves
    print "Choose a square (#{board.unmarked_keys.join(', ')}): "

    choice = nil
    loop do
      choice = $stdin.gets.chomp.to_i
      break if board.unmarked_keys.include?(choice)
      puts "Sorry... not a valid choice."
    end
    board.set_square_at(choice, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    if board.detect_winner == HUMAN_MARKER
      puts "You won!"
    elsif board.detect_winner == COMPUTER_MARKER
      puts "Computer won!"
    else
      puts "It's a tie!"
    end 
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again? (y/n): "
      answer = $stdin.gets.chomp
      break if ['y','n'].include?(answer)
      puts "Must be (y)es or (n)o..."
    end
    answer == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def play
    display_welcome_message
    loop do
      board.reset
      display_board
      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        display_board
        break if board.someone_won? || board.full?
      end
      display_result
      display_goodbye_message
      break unless play_again?
    end
  end
end

game = TTTGame.new
game.play