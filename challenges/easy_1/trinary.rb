# trinary.rb

class Trinary
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def to_decimal
    return 0 unless numbers =~ /^[0-2]+$/
    trinary = 0
    numbers.reverse.each_char.with_index  do |char, index| 
      trinary += char.to_i * (3 ** index)
    end
    trinary
  end
end