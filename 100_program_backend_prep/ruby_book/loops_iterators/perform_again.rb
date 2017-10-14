# perform_again.rb 

loop do
  puts "Do you want to do that again?"
  again = gets.chomp
  break if again != 'Y'
end