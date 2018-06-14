def each(collection)
  index = 0
  while index < collection.size
    yield(collection[index])
    index += 1
  end

  collection
end

each([1,2,3,4]) { |num| puts num }