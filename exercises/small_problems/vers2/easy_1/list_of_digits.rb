# list_of_digits.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way:'
def digit_list(digits)
  str_digit_arr = digits.to_s.chars
  str_digit_arr.map(&:to_i)
end

puts digit_list(12_345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts 'Another way:'
def digit_list2(digits)
  str_digits = digits.to_s
  str_digits.chars.map do |num|
    num.to_i
  end
end

puts digit_list2(12_345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
