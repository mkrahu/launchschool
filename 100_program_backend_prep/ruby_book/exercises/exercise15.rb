# exercise15.rb 
# Final exercises from the Intro to Programming LaunchSchool book

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |a| a.start_with?("s") }

p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

puts "One way"
arr.delete_if { |a| a.start_with?("s") || a.start_with?("w") }

p arr

puts "Better way"
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |a| a.start_with?("s","w") }

p arr