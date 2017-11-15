# convert_number_to_string.rb
# Convert a Number to a String! exercise
# Small Problems exercises from LaunchSchool

def integer_to_string(num)
  str = []
  loop do
    str.unshift(num % 10)
    num = num / 10
    break if num == 0
  end
  str.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
