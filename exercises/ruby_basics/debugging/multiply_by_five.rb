def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp

puts "The result is #{multiply_by_five(number)}!"

# When we get the input from the user on line 6 the number is a string, therefore the multiplication in the multiply_by_five
# does not work appropriately