def merge(arr1, arr2)
  sorted_arr = []
  index1 = 0
  index2 = 0

  while index1 < arr1.size && index2 < arr2.size
    if arr1[index1] < arr2[index2]
      sorted_arr << arr1[index1]
      index1 += 1
    else
      sorted_arr << arr2[index2]
      index2 += 1
    end
  end

  if index1 == arr1.size
    sorted_arr + arr2[index2..-1]
  else
    sorted_arr + arr1[index1..-1]
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]