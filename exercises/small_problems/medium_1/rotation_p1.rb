# rotation_p1.rb
# Rotation (Part 1) exercise
# Small Problems exercises from LaunchSchool

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]

#Further exploration
def rotate_string(str)
  rotate_array(str)
end

p rotate_string('hello')

def rotate_integer(num)
  rotate_array(num.to_s).to_i
end

p rotate_integer(12345)
