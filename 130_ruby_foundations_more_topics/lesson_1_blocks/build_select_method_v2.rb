def select(arr)
  selected_arr = []
  arr.each { |element| selected_arr << element if yield(element) }
  selected_arr
end

p select([1,2,3,4,5]) { |num| num.odd? }