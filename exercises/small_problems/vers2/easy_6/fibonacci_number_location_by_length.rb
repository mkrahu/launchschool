# fibonacci_number_location_by_length.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def find_fibonacci_index_by_length(num)
  index = 2
  num1, num2 = 1, 1
  until num2.to_s.length >= num
    num1, num2 = num2, num1 + num2
    index += 1
  end
  index
end

# test cases
p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847