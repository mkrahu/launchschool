# countdown3.rb 

print "Give me a number: "
x = $stdin.gets.chomp.to_i

for i in 1..x do
  puts i
end

puts "Done!"