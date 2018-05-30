class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'number must be positive' if number < 0
    sum_of_divisors = (1...number).select { |num| number % num == 0 }.reduce(:+)
    if sum_of_divisors < number
      'deficient'
    elsif sum_of_divisors == number
      'perfect'
    else
      'abundant'
    end
  end
end