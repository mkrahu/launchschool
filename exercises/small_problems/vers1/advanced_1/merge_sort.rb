require 'pry'

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


def merge_sort(arr)
  return arr if arr.size == 1

  mid = arr.size / 2

  merge(merge_sort(arr[0...mid]),merge_sort(arr[mid..-1]))
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
