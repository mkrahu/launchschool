# loop_on_commandv2.rb 
# Loop on Command exercise
# Ruby Basics exercises from LaunchSchool
# Second round to practice for assessment

loop do 
  puts 'Should I stop looping?'
  answer = $stdin.gets.chomp
  break if answer.downcase == 'yes'
end