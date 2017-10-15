# array_average.rb
# Array Average exercise
# Small Problems exercises from LaunchSchool


def average(array)
  sum = 0
  array.each { |a| sum += a }
  sum / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


def average_f(array)
  sum = 0
  array.each { |a| sum += a }
  sum / array.length.to_f
end

puts average_f([1, 5, 87, 45, 8, 8])
puts average_f([9, 47, 23, 95, 16, 52])
puts average_f([9,5])