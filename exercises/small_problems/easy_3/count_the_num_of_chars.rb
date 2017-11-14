# count_the_num_of_chars.rb
# Count the Number of Characters exercise
# Small Problems exercises from LaunchSchool

print "Please write a word or multiple words: "
input = $stdin.gets.chomp

input_length = input.split.join.length

puts "There are #{input_length} characters in \"#{input}\""