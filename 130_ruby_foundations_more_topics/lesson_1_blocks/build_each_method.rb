# build_each_method.rb

def each(arr)
  index = 0

  while index < arr.size
    yield(arr[index])
    index += 1
  end

  arr
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end