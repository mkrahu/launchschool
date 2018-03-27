# odd_lists.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def oddities(arr)
  arr.select.with_index do |_,index|
    (index + 1).odd?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []