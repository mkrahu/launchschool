# sum_of_digits.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45