# are_you_there.rb
# Are You There exercise
# Ruby Basics exercises from LaunchSchool

colors = 'blue pink yellow orange'

puts "One way:"
puts colors =~ /yellow/ ? true : false 
puts colors =~ /purple/ ? true: false

puts "Another way:"
puts colors.include?('yellow')
puts colors.include?('purple')