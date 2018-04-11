#!/usr/bin/env ruby -wKU
# number_guesser_p2.rb

class GuessingGame
  def initialize(low_num, high_num)
    @low_num = low_num
    @high_num = high_num
    @number = nil
    @guesses = calculate_number_of_guesses
    @guess = 0
  end

  def play
    loop do
      reset
      display_remaining_guesses
      request_guess
      display_results
      break if correct_number? || out_of_guesses?
    end
  end

  private
  attr_accessor :guesses, :guess, :number
  attr_reader :low_num, :high_num

  def reset
    self.number = rand(low_num..high_num)
  end

  def calculate_number_of_guesses
    size_of_range = (low_num..high_num).size
    Math.log2(size_of_range).to_i + 1
  end

  def display_remaining_guesses
    if guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{guesses} remaining."
    end
  end

  def request_guess
    print "Enter a number between #{low_num} and #{high_num}: "
    loop do
      self.guess = $stdin.gets.chomp.to_i
      break if valid_guess?
      print "Invalid Guess. Enter a number between #{low_num} and #{high_num}: "
    end
  end

  def valid_guess?
    (low_num..high_num).cover?(guess)
  end

  def display_results
    self.guesses = guesses - 1

    if correct_number?
      puts "You win!"
    elsif guess < number
      puts "Your guess is too low."
    elsif guess > number
      puts "Your guess is too high."
    end
    puts "You are out of guesses. You lose." if out_of_guesses?
  end

  def correct_number?
    guess == number
  end

  def out_of_guesses?
    guesses == 0
  end

end

game = GuessingGame.new(501, 1500)
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low