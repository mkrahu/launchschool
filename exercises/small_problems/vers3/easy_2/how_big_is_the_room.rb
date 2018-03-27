# how_big_is_the_room.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

SQ_METER_TO_SQ_FT = 10.7639

print "Enter the length of the room in meters: "
length = $stdin.gets.chomp.to_f

print "Enter the width of the room in meters: "
width = $stdin.gets.chomp.to_f

area_sq_meters = length * width
area_sq_feet = area_sq_meters * SQ_METER_TO_SQ_FT

puts "The area of the room is #{area_sq_meters} (#{area_sq_feet})."