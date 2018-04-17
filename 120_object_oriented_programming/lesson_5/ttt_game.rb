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

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def [](num)
    @squares[num]
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if identical_markers(squares) == 3
    end
    nil
  end

  def at_risk_square(marker)
    square = nil
    WINNING_LINES.each do |line|
      if @squares.select { |k,v| line.include?(k) && v.marker == marker }.size == 2
        line.each { |num| return num if @squares[num].unmarked? }
      end
    end
    nil
  end

  private

  def identical_markers(squares)
    identical = squares.select do |square|
      (square.marker == squares.first.marker) && square.marked?
    end
    identical.size
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

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker, :name

  def initialize(marker, name)
      @marker = marker
      @name = name
  end
end

class Human < Player
  def initialize
    super(request_player_marker, request_name)
    @name = request_name
  end

  def request_player_marker
    print "Please pick your marker (single character only): "
    marker = nil
    loop do
      marker = $stdin.gets.chomp
      break if marker.length == 1
      puts "Not a valid marker"
    end
    marker
  end

  def request_name
    "Mike"
  end
end

class Computer < Player
  COMPUTER_NAMES = ['R2D2', 'C-3PO']
  COMPUTER_MARKER = 'O'

  def initialize
    super(COMPUTER_MARKER, COMPUTER_NAMES.sample)
  end
end

class TTTGame
  FIRST_TO_MOVE = :human
  PLAY_T0 = 5
  attr_reader :board, :human, :computer, :score

  def initialize()
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_player = FIRST_TO_MOVE
    @score = {human: 0, computer: 0}
  end

  def play
    display_welcome_message
    loop do
      loop do
        display_board
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end
        clear_screen_and_display_board
        update_score
        break if game_winner?
        display_result_and_new_score
        reset
      end
      display_game_winner
      break unless play_again?
      display_play_again_message
    end
    display_goodbye_message
  end

  private



  def clear
    system 'clear'
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe!"
  end

  def display_board
    print "#{human.name}'s marker is #{human.marker}. "
    puts "#{computer.name}'s marker is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(arr)
    if arr.length ==  1 
      arr[0]
    else 
      arr[0..-2].join(', ') + " or #{arr[-1]}"
    end
  end

  def human_moves
    print "Choose a square (#{joinor(board.unmarked_keys)}): "

    choice = nil
    loop do
      choice = $stdin.gets.chomp.to_i
      break if board.unmarked_keys.include?(choice)
      puts "Sorry... not a valid choice."
    end
    board[choice] = human.marker
  end

  def computer_moves
    if choice = board.at_risk_square(computer.marker)
      board[choice] = computer.marker
    elsif choice = board.at_risk_square(human.marker)
      board[choice] = computer.marker
    elsif board[5].unmarked?
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if @current_player == :human
      human_moves
      @current_player = :computer
    else
      computer_moves
      @current_player = :human
    end
  end

  def human_turn?
    @current_player == :human
  end

  def update_score
    if board.winning_marker == human.marker
      @score[:human] += 1
    elsif board.winning_marker == computer.marker
      @score[:computer] += 1
    else
      puts "It's a tie!"
    end
  end

  def display_result_and_new_score
    clear
    if board.winning_marker == human.marker
      puts "#{human.name} won!"
    elsif board.winning_marker == computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
    puts "Score is now #{human.name}: #{@score[:human]} - #{computer.name}: #{@score[:computer]}"
  end

  def game_winner?
    @score.value?(PLAY_T0)
  end

  def display_game_winner
    if @score[:human] == PLAY_T0
      puts "#{human.name} the game!"
    else
      puts "#{computer.name} won the game!"
    end
    puts "Final score... #{human.name}: #{@score[:human]} - #{computer.name}: #{@score[:computer]}"
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again? (y/n): "
      answer = $stdin.gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Must be (y)es or (n)o..."
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_player = :human
  end

  def display_play_again_message
    puts "Let's play again!"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

game = TTTGame.new
game.play
