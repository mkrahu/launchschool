def factorial(n)
  if n == 1
    1
  else
    n * factorial(n-1)
  end
end

puts "One way:"
puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 

puts "Another way:"
puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)