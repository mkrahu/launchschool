# fibonacci_number_location_by_length.rb
# Fibonacci Number Location By Length exercise
# Small Problems exercises from LaunchSchool

def find_fibonacci_index_by_length(length)
  a, b = 1, 1
  index = 2

  until b.to_s.length >= length
    a, b = b , b + a
    index += 1
  end
  index
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
