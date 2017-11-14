# searching_101.rb
# Searching 101 exercise
# Small Problems exercises from LaunchSchool

def ordinal(n)
  case n % 10
   when 1 then 'st'
   when 2 then 'nd'
   when 3 then 'rd'
   else 'th'
  end
end


input_numbers = []

5.times do |n|
  print "Enter the #{n+1}#{ordinal(n+1)} number: "
  input_numbers << $stdin.gets.chomp.to_i
end

print "Enter the last number: "
last_number = $stdin.gets.chomp.to_i

if input_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{input_numbers.inspect}"
else
  puts "The number #{last_number} does not appear in #{input_numbers.inspect}"
end