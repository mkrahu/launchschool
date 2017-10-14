movies = {
  fast_five: 2011,
  oceans_eleven: 2001,
  casino_royale: 2006,
  the_imitation_game: 2014,
  the_fighter: 2010
}

puts "One way:"
puts movies[:fast_five]
puts movies[:oceans_eleven]
puts movies[:casino_royale]
puts movies[:the_imitation_game]
puts movies[:the_fighter]

puts

puts "Another way:"
movies.each do |key, value|
  puts value
end