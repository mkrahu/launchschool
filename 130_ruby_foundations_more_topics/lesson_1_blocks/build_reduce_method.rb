# build_reduce_method.rb

def reduce(arr, accum = 0)
  index = 0
  reduce_acc = accum
  while index < arr.size
    reduce_acc = yield(reduce_acc, arr[index])
    index += 1
  end
  reduce_acc
end

# def reduce(array, default=0)
#   counter = 0
#   accumulator = default

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end

#   accumulator
# end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? } 