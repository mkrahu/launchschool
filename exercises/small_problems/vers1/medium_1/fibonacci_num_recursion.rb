# fibonacci_num_recursion.rb
# Fibonacci Numbers (Recursion) exercise
# Small Problems exercises from LaunchSchool

def fibonacci(n)
  return 1 if [1, 2].include?(n)
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    puts "#{nth - 1}; #{acc1} and #{acc2}"
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci2(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci2(12) == 144