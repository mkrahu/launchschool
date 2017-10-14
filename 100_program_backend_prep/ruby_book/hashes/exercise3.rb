# exercise3.rb 
# Exercises for chapter 'Hashes' in LaunchSchool Intro To Programming Ruby

hash = {
  first_name: "Mike",
  last_name: "Krahulec",
  age: 30,
  language: "English"
}

puts "Print the keys:"
hash.keys.each { |key| puts key }
puts
puts "Print the values:"
hash.values.each { |value| puts value }
puts
puts "Print both together!"
hash.each { |key, value| puts "#{key}: #{value}"}