# practice_medium_1.rb
# Practice Problems: Medium 1 program
# Practice Problems exercises from LaunchSchool

# Question 1
# puts output with one more right indentation each time (10 times total)

10.times { |i| puts (' ' * i) + "The Flintstones Rock!"}

# Question 2
# What is the error? Error is that (40 + 2) is an integer and it 
# cannot be added to a string

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3
# Make factors method work without begin until

def factors(number)
  dividend = 1
  divisors = []
  while dividend <= number
    divisors << dividend if number % dividend == 0
    dividend += 1
  end
  divisors
end

p factors(10)

# Question 4
# Are the two methods different?
# Yes, the first method using << mutates that array passed in as the
# buffer paramter while the second method returns the same resulting
# buffer but does not affect the original input_array passed into the
# the method

# Question 5
# Limit is defined outside the methods scope and therefore is not
# available to the method

# Add limit as a parameter
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

p fib(0,1,15)

# Question 6
# Alter the method to make its results easier to predict

def less_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = less_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


