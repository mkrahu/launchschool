class Luhn
  def self.create(number)
    possible_luhn = number * 10
    diff = self.new(possible_luhn).checksum % 10
    return possible_luhn if diff == 0
    (number.to_s + (10 - diff).to_s).to_i
  end

  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def addends
    reversed = numbers.to_s.reverse.split('')
    transform = reversed.map.with_index do |num, index|
      if index.odd?
        (num.to_i * 2) > 9 ? ((num.to_i * 2) - 9).to_s : (num.to_i * 2).to_s
      else
        num
      end
    end
    transform.reverse.map(&:to_i)
  end

  def checksum
    addends.reduce(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end

end

p Luhn.new(8739563).valid?