#!/usr/bin/env ruby -wKU
# number_guesser_p1.rb

require 'pry'

LOW_NUM = 1
HIGH_NUM = 100
NUMBER_OF_GUESSES = 7

class GuessingGame
  def initialize
    @low_num = LOW_NUM
    @high_num = HIGH_NUM
    @number = nil
    @guesses = NUMBER_OF_GUESSES
    @guess = 0
  end

  def play
    reset
    loop do
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
    binding.pry
    if correct_number?
      puts "You win!"
    elsif guess < number
      puts "Your guess is too low."
    elsif guess > number
      puts "Your guess is too high."
    end
    puts "You are out of guesses. You lose. The number was #{number}." if out_of_guesses?
  end

  def correct_number?
    guess == number
  end

  def out_of_guesses?
    guesses == 0
  end

end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low