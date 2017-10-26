# practice_hard_1.rb
# Practice Problems: Hard 1 program
# Practice Problems exercises from LaunchSchool

# Question 1
# I mistakenly thought this would cause an error until I played around
# in irb. Turns out the variable was already initialized but not assigned
# and therefore it returned nil

# Question 2
# Fired up irb as I wasn't sure on this one as well... It turned out as
# I expected, the assignment to informal_greeting is a reference to the
# original object, and then because << mutates the caller it affects
# the 'hi' string stored in greetings[:a]

# Question 3

# A - print out 'one', 'two', 'three' - Assignment does NOT mutate
# the caller and therefore the variables remain unaffected outside
# of the method
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# B - Same as above 'one', 'two', 'three' - Assignment does NOT mutate
# the caller

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# C - Prints 'two', 'three', 'one' - gsub! mutates the caller and
# therefore the original variables values are changed

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Question 4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  return true
end