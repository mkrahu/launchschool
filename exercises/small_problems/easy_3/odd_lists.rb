# odd_lists.rb
# Odd Lists exercise
# Small Problems exercises from LaunchSchool

def oddities(arr)
  arr.select.with_index do |element, index|
    index.even?
  end
end


puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []