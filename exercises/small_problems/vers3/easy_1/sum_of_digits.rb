# sum_of_digits.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def sum(num)
  num.to_s.split('').map(&:to_i).inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45