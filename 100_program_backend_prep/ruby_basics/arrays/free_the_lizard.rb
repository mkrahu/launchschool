# new_pet.rb
# New Pet exercise
# Ruby Basics exercises from LaunchSchool

pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..3]
my_pets.delete('lizard')
puts "I have a pet #{my_pets[0]}!"