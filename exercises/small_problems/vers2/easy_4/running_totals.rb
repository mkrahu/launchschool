# running_totals.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def running_total(arr)
  arr.map.with_index { |_, index| arr[0..index].sum }
end

# test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []