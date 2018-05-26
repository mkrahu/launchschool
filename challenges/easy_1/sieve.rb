# sieve.rb

class Sieve
  attr_reader :number
  attr_accessor :prime_tracker
  
  def initialize(number)
    @number = number
    @prime_tracker = {}
    2.upto(number) { |number| @prime_tracker[number] = true}
  end

  def primes
    raise ArgumentError, 'number too small' if number < 2

    2.upto(number) do |index|
      ((2*index)..number).step(index) { |index| prime_tracker[index] = false }
      index += 1
    end

    prime_tracker.select { |key, value| value }.keys
  end
end
