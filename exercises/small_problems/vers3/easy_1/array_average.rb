# array_average.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def average(arr)
  arr.inject(:+) / arr.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40