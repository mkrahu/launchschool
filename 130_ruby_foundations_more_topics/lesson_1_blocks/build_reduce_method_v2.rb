def reduce(arr, default=0)
  accumulator = default
  arr.each { |element| accumulator = yield(accumulator, element) }
  accumulator
end

def reduce2(arr, default=0)
  accumulator = default
  index = 0

  while index < arr.size
    accumulator = yield(accumulator, arr[index])
    index += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num } 

puts

p reduce2(array) { |acc, num| acc + num }
p reduce2(array, 10) { |acc, num| acc + num }

# Further exploration

def reduce_flexible(arr, default=nil)
  if default.nil?
    index = 1
    accumulator = arr[0]
  else
    index = 0
    accumulator = default
  end

  while index < arr.size
    accumulator = yield(accumulator, arr[index])
    index += 1
  end

  accumulator
end

p reduce_flexible(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce_flexible([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
