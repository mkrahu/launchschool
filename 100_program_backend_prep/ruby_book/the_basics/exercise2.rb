print "Give me a 4 digit number: "
number = gets.chomp.to_i

# my results
thousands = number / 1000
hundreds = number / 100 % 10
tens = number / 10 % 10
ones = number % 10

# book results
thousands = number / 1000
hundreds = number % 1000 / 100
tens = number % 1000 % 100 / 10
ones = number % 1000 % 100 % 10



puts "number: #{number}"
puts "thousands: #{thousands}"
puts "hundreds: #{hundreds}"
puts "tens: #{tens}"
puts "ones: #{ones}"