# does_my_list_include_list.rb
# Does My List Include This? exercise
# Small Problems exercises from LaunchSchool


def include?(arr, value)
  index = 0
  while index < arr.length
    return true if arr[index] == value
    index += 1
  end
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

puts "Another way:"
def include2?(arr, value)
  !!arr.find_index(value)
end


puts include2?([1,2,3,4,5], 3) == true
puts include2?([1,2,3,4,5], 6) == false
puts include2?([], 3) == false
puts include2?([nil], nil) == true
puts include2?([], nil) == false

puts "And Another:"

def include3?(arr,value)
  arr.each { |a| return true if a == value }
  false
end

puts include3?([1,2,3,4,5], 3) == true
puts include3?([1,2,3,4,5], 6) == false
puts include3?([], 3) == false
puts include3?([nil], nil) == true
puts include3?([], nil) == false
