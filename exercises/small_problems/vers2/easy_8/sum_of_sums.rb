# sum_of_sums.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def sum_of_sums(arr)
  sums = 0
  arr.each_with_index { |_, index| sums += arr[0..index].sum }
  sums
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35