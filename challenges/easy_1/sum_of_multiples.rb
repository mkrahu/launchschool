# sum_of_multiples.rb

class SumOfMultiples
  attr_reader :numbers

  def self.to(high_num)
    multiples = 1.upto(high_num - 1).select do |num|
      num % 3 == 0 || num % 5 == 0
    end
    multiples.inject(0,:+)
  end

  def initialize(*numbers)
    @numbers = numbers
    @numbers = [3, 5] if numbers.empty?
  end

  def to(high_num)
    multiples = 1.upto(high_num - 1).select do |num|
      numbers.any? { |divisor| num % divisor == 0 }
    end
    multiples.inject(0,:+)
  end
end
