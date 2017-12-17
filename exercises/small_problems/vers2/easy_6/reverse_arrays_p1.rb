# reverse_arrays.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def reverse!(arr)
  mid = arr.length / 2
  index1, index2 = 0, -1
  while index1 < mid
    arr[index1], arr[index2] = arr[index2], arr[index1]
    index1 += 1
    index2 -= 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []


