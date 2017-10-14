# exercise9.rb 
# Final exercises from the Intro to Programming LaunchSchool

h = { a: 1, b: 2, c: 3, d: 4 }

puts h[:b]
h[:e] = 5
p h

puts "One way to delete < 3.5"
h.each do |k,v|
  h.delete(k) if v < 3.5
end
p h

puts "Another way:"
h = { a: 1, b: 2, c: 3, d: 4, e: 5}

h.delete_if { |k,v| v < 3.5 }
p h