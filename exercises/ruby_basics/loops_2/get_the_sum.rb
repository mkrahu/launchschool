# get_the_sum.rb
# Get the Sum exercise
# Ruby Basics exercises from LaunchSchool

loop do 
  print 'What does 2 + 2 equal? '
  answer = $stdin.gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end
end