# welcome_stranger.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def greetings(name_arr, occ_hash)
  puts "Hello, #{name_arr[0]} #{name_arr[1]} #{name_arr[2]}! Nice to have a #{occ_hash[:title]} #{occ_hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })