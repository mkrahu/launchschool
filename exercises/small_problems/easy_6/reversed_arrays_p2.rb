# reversed_arrays_p2.rb
# Reversed Arrays (Part 2) exercise
# Small Problems exercises from LaunchSchool

def reverse(arr)
  new_arr = []
  index = arr.length - 1
  while index >= 0
    new_arr << arr[index]
    index -= 1
  end 
  new_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]
puts reverse(%w(a b c d e)) == %w(e d c b a)
puts reverse(['abc']) == ['abc']
puts reverse([]) == []

list = [1, 2, 3]
new_list = reverse(list)
puts list.object_id != new_list.object_id
puts list == [1, 2, 3]
puts new_list == [3, 2, 1]

puts "Further exploration:"
def reverse2(arr)
  arr.reverse.each_with_object([]) { |a, object| object << a }
end

puts reverse2([1,2,3,4]) == [4,3,2,1]
puts reverse2(%w(a b c d e)) == %w(e d c b a)
puts reverse2(['abc']) == ['abc']
puts reverse2([]) == []

list = [1, 2, 3]
new_list = reverse2(list)
puts list.object_id != new_list.object_id
puts list == [1, 2, 3]
puts new_list == [3, 2, 1]
