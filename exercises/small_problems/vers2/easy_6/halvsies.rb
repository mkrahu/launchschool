# halvsies.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def halvsies(arr)
  midpoint = arr.length.even? ? arr.length / 2 : (arr.length / 2) + 1
  arr1 = arr[0,midpoint]
  arr2 = arr[midpoint..-1]
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]