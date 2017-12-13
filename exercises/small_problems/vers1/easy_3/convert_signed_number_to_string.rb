# convert_signed_number_to_string.rb
# Convert a Signed Number to a String! exercise
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


def signed_integer_to_string(num)
  if num < 0
    '-' + integer_to_string(num.abs)
  elsif num > 0
    '+' + integer_to_string(num)
  else
    '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'