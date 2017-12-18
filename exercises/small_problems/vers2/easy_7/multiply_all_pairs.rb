# multiply_all_pairs.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |subarr| subarr.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]