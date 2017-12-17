# does_my_list_included_this.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def include?(arr, value)
  arr.count(value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts 'Another way'
def include2?(arr, value)
  arr.each { |element| return true if element == value }
  false
end

p include2?([1,2,3,4,5], 3) == true
p include2?([1,2,3,4,5], 6) == false
p include2?([], 3) == false
p include2?([nil], nil) == true
p include2?([], nil) == false