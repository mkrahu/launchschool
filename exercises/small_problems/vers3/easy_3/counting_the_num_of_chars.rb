# counting_the_num_of_chars.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

print 'Please write a word or multiple words: '
input = $stdin.gets.chomp

input_length = input.split.join.length

puts "There are #{input_length} characters in \"#{input}\""