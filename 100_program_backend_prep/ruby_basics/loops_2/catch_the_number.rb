# catch_the_number.rb
# Catch the Number exercise
# Ruby Basics exercises from LaunchSchool

puts "One way:"
loop do 
  number = rand(100)
  puts number
  break if number <= 10
end

puts "Another way:"
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end