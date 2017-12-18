# multiply_lists.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def multiply_list(arr1, arr2)
  arr1.map.with_index { |element, index| element * arr2[index] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]