# halvsies.rb
# Halvsies exercise
# Small Problems exercises from LaunchSchool

def halvsies(arr)
  middle = arr.length.odd? ? (arr.length / 2) + 1 : (arr.length / 2)
  [arr[0,middle], arr[middle..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]