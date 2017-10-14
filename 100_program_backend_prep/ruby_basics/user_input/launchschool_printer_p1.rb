# launchscool_printer_p1.rb
# Launch School Printer (Part 1) exercise
# Ruby Basics exercises from LaunchSchool

loop do 
  print "How many output lines do you want? >= 3: "
  number = $stdin.gets.chomp.to_i

  if number >= 3
    number.times { puts "Launch School is the best!" }
    break
  else
    puts "That's not enough lines..."
  end
end