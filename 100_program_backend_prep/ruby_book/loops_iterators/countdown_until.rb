# countdown.rb
print "Enter a number: "
x = $stdin.gets.chomp.to_i

until x < 0
  puts x
  x -= 1
end

puts "Done!"