# odd_lists.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def oddities(arr)
  arr.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []