# fibonacci_num_last_digit.rb
# Fibonacci Numbers (Last Digit) exercise
# Small Problems exercises from LaunchSchool

def fibonacci(n)
  return 1 if n <= 2
  n1, n2 = 1, 1
  3.upto(n) do
    n1, n2 = n2, n1 + n2
  end
  n2
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

#p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
#p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
#p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
#p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
#p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
#p fibonacci_last(123_456_789) # -> 4

# Better way

def fibonacci_last2(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci_last2(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last2(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last2(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last2(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last2(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last2(123_456_789) # -> 4