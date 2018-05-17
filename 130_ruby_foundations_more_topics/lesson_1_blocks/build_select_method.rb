# build_select_method.rb

def select(arr)
  index = 0
  select_arr = []
  while index < arr.size
    select_arr << arr[index] if yield(arr[index])
    index += 1
  end

  select_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 } 