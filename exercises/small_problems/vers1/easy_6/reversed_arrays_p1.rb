# reversed_arrays_p1.rb
# Reversed Arrays (Part 1) exercise
# Small Problems exercises from LaunchSchool

def reverse!(arr)
  index1 = 0
  index2 = -1
  while index1 < arr.length / 2
    arr[index1] , arr[index2] = arr[index2], arr[index1]
    index1 += 1
    index2 -= 1
  end
  arr
end


list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
puts list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
puts list == ["abc"]

list = []
reverse!(list) # => []
puts list == []
