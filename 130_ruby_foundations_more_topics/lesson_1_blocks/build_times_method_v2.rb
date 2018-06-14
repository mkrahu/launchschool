def times(number)
  (0...number).each { |num| yield(num) }
end

#times(5) { |num| puts num }

def times2(number)
  index = 0
  while index < number * 2
    yield(index)
    index += 1
  end
  number * 2
end

times2(5) { |num| puts num }