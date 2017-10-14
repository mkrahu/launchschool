# exercise4.rb 
# Exercises from Chapter 'Loops and Iterators' LaunchSchool

def countdown_recursive(number)
  if number <= 0
    puts number
  else
    puts number
    countdown_recursive(number - 1)
  end
end

countdown_recursive(10)
countdown_recursive(5)
countdown_recursive(-3)