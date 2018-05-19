# find_missing_numbers.rb

def missing(arr)
  return [] if arr.size <= 1

  (arr[0]..arr[-1]).select { |num| !arr.include?(num) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []