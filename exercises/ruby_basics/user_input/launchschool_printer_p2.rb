# launchscool_printer_p2.rb
# Launch School Printer (Part 2) exercise
# Ruby Basics exercises from LaunchSchool


loop do 
  print "How many output lines do you want? >= 3 (Q to quit): "
  number = $stdin.gets.chomp

  if number.to_s.upcase == 'Q'
    break
  elsif number.to_i >= 3
    number.to_i.times { puts "Launch School is the best!" }
  else
    puts "That's not enough lines..."
  end
end