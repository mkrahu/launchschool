# sum_of_sums.rb
# Sum of Sums exercise
# Small Problems exercises from LaunchSchool

def sum_of_sums(arr)
  sum_of_sums = 0
  accum_sum = 0
  arr.each do |num|
    accum_sum += num
    sum_of_sums += accum_sum
  end
  sum_of_sums
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35