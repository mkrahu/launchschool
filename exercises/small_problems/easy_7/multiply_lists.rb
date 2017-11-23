# multiply_lists.rb
# Multiply Lists exercise
# Small Problems exercises from LaunchSchool

def multiply_list(arr1, arr2)
  arr1.map.with_index do |num, index|
    num * arr2[index]
  end
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# further exploration
puts "Further exploration: "
def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
