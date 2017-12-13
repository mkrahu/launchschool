# welcome_stranger.rb
# Welcome Stranger exercise
# Small Problems exercises from LaunchSchool

def greetings(name_arr, occupation_hash)
  full_name = name_arr.join(' ')
  occupation = "#{occupation_hash[:title]} #{occupation_hash[:occupation]}"
  puts "Hello #{full_name}! What's it like to be a #{occupation}?"
end

greetings(%w(John Q Doe), title: 'Master', occupation: 'Plumber')
