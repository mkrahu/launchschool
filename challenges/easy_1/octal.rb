# octal.rb

class Octal
  attr_reader :numbers

  def initialize(octal_numbers)
    @numbers = octal_numbers
  end

  def to_decimal
    return 0 unless numbers =~ /^[0-7]+$/
    decimal = 0
    numbers.reverse.each_char.with_index  do |char, index| 
      decimal += char.to_i * (8 ** index)
    end
    decimal
  end
end