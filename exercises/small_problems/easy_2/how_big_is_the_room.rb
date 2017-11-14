# how_big_is_the_room.rb
# How Big is the Room? exercise
# Small Problems exercises from LaunchSchool

SQ_FT_TO_SQ_INCHES = 144
SQ_INCHES_TO_SQ_CM = 6.4516

print "Enter the length of the room in feet: "
length = $stdin.gets.chomp.to_f

print "Enter the width of the room in feet: "
width = $stdin.gets.chomp.to_f

area_feet = (length * width).round(2)
area_inches = (area_feet * SQ_FT_TO_SQ_INCHES).round(2)
area_cm = (area_inches * SQ_INCHES_TO_SQ_CM).round(2)

puts "The area of the room is #{area_feet} square feet (#{area_inches} square inches and #{area_cm} square centimeters)."