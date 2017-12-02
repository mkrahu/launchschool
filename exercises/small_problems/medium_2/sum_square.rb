# sum_square.rb
# Sum Square - Square Sum exercise
# Small Problems exercises from LaunchSchool


def sum_square_difference(n)
  n_array = (1..n).to_a
  sum_square = n_array.inject(:+) ** 2
  square_sum = n_array.inject(0) {|sum, num| sum + num ** 2 }
  sum_square - square_sum
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150