# opposites_attract.rb
# Opposites Attract exercise
# Ruby Basics exercises from LaunchSchool

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string != 0
end

loop do 
  print "Please enter a positive or negative number: "
  number_1 = gets.chomp
  print "Please enter another positive or negative number: "
  number_2 = gets.chomp

  if valid_number?(number_1) && valid_number?(number_2)
    if number_1.to_i * number_2.to_i < 0
      puts "#{number_1} + #{number_2} = #{number_1.to_i + number_2.to_i}"
      break
    else
      puts "Sorry. One integer must be positive and one must be negative."
      puts "Please start over."
    end
  else
    puts "Invalid input. Only non-zero numbers are allowed."
  end
end