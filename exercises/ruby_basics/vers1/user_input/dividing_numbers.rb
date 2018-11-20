# dividing_numbers.rb
# Dividing Numbers exercise
# Ruby Basics exercises from LaunchSchool

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
numerator = nil
denominator = nil

loop do
  print "Please enter the numerator: "
  break if valid_number?(numerator = $stdin.gets.chomp)
  puts "Invalid entry. Only integers allowed..."
end


loop do
  print "Please enter the denominator: "
  if valid_number?(denominator = $stdin.gets.chomp)
    break if denominator.to_i != 0
    puts "Denominator cannot be zero."
  else
    puts "Invalid entry. Only integers allowed..."
  end
end

puts "#{numerator} / #{denominator} is #{ numerator.to_i / denominator.to_i }"