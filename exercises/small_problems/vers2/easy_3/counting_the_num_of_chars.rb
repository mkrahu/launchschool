# counting_the_num_of_chars.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

print "Please write a word or multiple words: "
word = $stdin.gets.chomp

count = word.split.inject(0) { |sum, element| sum + element.length }

puts "There are #{count} charaters in \"#{word}\"."

# other options
# count = word.delete(' ').size
# count = word.split.join.size