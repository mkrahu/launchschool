# arithmetic_integer.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

print 'Enter the first number: '
num1 = $stdin.gets.chomp.to_i

print 'Enter the second number: '
num2 = $stdin.gets.chomp.to_i

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"