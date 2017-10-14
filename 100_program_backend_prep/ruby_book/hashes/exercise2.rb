# exercise2.rb 
# Exercises for chapter 'Hashes' in LaunchSchool Intro To Programming Ruby

h1 = { mike: "Krahulec", katie: "Ueland" }
h2 = { ruby: "Rails", python: "Django" }

puts "Using merge returns the two merged hashes"
return1 = h1.merge(h2)
p return1
puts "But the original stays the same"
p h1
puts
puts "Using merge! returns the two merged hashes again"
return2 = h1.merge!(h2)
p return2
puts "But now the orginal has now changed!"
p h1