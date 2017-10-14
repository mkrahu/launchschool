# unpredictable_weather_p3.rb
# Unpredictable Weather (Part 3) exercise
# Ruby Basics exercises from LaunchSchool

sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'