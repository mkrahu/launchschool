# fibonacci_num_procedural.rb
# Fibonacci Numbers (Procedural) exercise
# Small Problems exercises from LaunchSchool

def fibonacci(n)
  return 1 if n <= 2
  n1, n2 = 1, 1
  3.upto(n) do
    n1, n2 = n2, n1 + n2
  end
  n2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501