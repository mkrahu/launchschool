# how_big_is_the_room.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

SQ_METERS_TO_SQ_FEET = 10.7639

print "Enter the length of the room in meters: "
length = $stdin.gets.chomp.to_i

print "Enter the width of the room in meters: "
width = $stdin.gets.chomp.to_i

area = length * width
area_sq_ft = area * SQ_METERS_TO_SQ_FEET
puts "The area of the room is #{area} square meters (#{area_sq_ft} square feet)."