# practice_easy_1.rb
# Practice Problems: Easy 1 program
# Practice Problems exercises from LaunchSchool

# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# what will this output? 1, 2, 2, 3
# what if you want the uniq to be the output?
numbers.uniq!
puts numbers

# Question 2

# 1. What is != and where should you use it?
# It is the boolean function NOT equal

# 2. put ! before something, like user_name
user_name = "Mike"
puts !user_name

# 3. put ! after something, like uniq
numbers = [1, 2, 2, 3]
puts numbers.uniq!

# 4. put ? before something
test = true
puts test ? "hello" : "goodbye"

# 5. put ? after something
puts 1.is_a? Integer

# 6. put !! before something
puts !!user_name

# Question 3
# Replace 'important' with 'urgent'
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!('important', 'urgent')

# Question 4
# How do delete_at and delete differ?
numbers = [1, 2, 3, 4, 5]
puts numbers.delete_at(1) # will delete 2
numbers = [1, 2, 3, 4, 5]
puts numbers. delete(1) # will delete 1

# Question 5
# Determine if 42 lies between 10 and 100 with a range
puts (10..100).cover?(42)

# Question 6
# Two different ways to put "Four score and" in front
famous_words = "seven years ago..."
puts "One way:"
puts "Four score and " + famous_words
puts "Another:"
puts famous_words.prepend("Four score and ")

# Question 7
# what will how_deep string return with eval?
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
puts eval(how_deep) # will return 42

# Question 8
# How do we unnest the flintstones array?

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

puts flintstones.flatten!

# Question 9
# Return the Barney entry with it's number
flintstones = { "Fred" => 0, "Wilma" => 1, 
                "Barney" => 2, "Betty" => 3, 
                "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")