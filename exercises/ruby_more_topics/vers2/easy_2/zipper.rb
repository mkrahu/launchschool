def zip(arr1, arr2)
  enum1 = arr1.each
  enum2 = arr2.each
  zipped_arr = []

  loop do
    zipped_arr << [enum1.next, enum2.next]
  end
  zipped_arr
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
