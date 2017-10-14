# exercise2.rb
# Exercises from Chapter 'Loops and Iterators' LaunchSchool

print "Give me a number: "
number = $stdin.gets.chomp.to_i

loop do
  print "To double, type 'Double', to stop, type 'Stop': "
  answer = $stdin.gets.chomp
  if answer.downcase == 'stop'
    break
  elsif answer.downcase == 'double'
    number_2 = number
    number *= 2
    puts "#{number_2} doubled is #{number}!"
  else
    puts "You need to type 'Double' or 'Stop'!"
  end
end