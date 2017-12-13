# array_average.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way'
def average(arr)
  arr.inject(:+) / arr.length
end

# test cases
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts 'Another way'
def average2(arr)
  arr.sum / arr.length
end

# test cases
puts average2([1, 5, 87, 45, 8, 8]) == 25
puts average2([9, 47, 23, 95, 16, 52]) == 40

puts 'And one more...'
def average3(arr)
  sum_arr = 0
  arr.each { |num| sum_arr += num }
  sum_arr / arr.length
end

# test cases
puts average2([1, 5, 87, 45, 8, 8]) == 25
puts average2([9, 47, 23, 95, 16, 52]) == 40