array = [2011, 2001, 2006, 2014, 2010]

puts "One way:"
puts array[0]
puts array[1]
puts array[2]
puts array[3]
puts array[4]

puts

puts "Another way:"
array.each do |year|
  puts year
end