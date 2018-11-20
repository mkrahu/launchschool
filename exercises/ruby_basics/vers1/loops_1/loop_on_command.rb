# loop_on_command.rb
# Loop on Command exercise
# Ruby Basics exercises from LaunchSchool

loop do 
  puts 'Should I stop looping?'
  break if 'yes' == $stdin.gets.chomp.downcase
  puts "Make sure to type 'yes' if you want the loop to stop..."
end