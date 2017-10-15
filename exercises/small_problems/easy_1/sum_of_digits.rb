# sum_of_digits.rb
# Sum of Digits exercise
# Small Problems exercises from LaunchSchool

puts "One way:"
def sum(digits)
  sum = 0
  arr = digits.to_s.split('')
  arr.each {|a| sum += a.to_i }
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts "Another way:"
def sum_1(number)
  number.to_s.chars.map(&:to_i).sum
end

puts sum_1(23) == 5
puts sum_1(496) == 19
puts sum_1(123_456_789) == 45

puts "And another:"

def sum_2(number)
  number.to_s.chars.map(&:to_i).inject(:+)
end

puts sum_2(23) == 5
puts sum_2(496) == 19
puts sum_2(123_456_789) == 45
