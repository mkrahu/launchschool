# squaring_an_arg.rb
# Squaring an Arg exercise
# Small Problems exercises from LaunchSchool

def multiply(a,b)
  a * b
end

def square(n)
  multiply(n,n)
end

def power(num, n)
  return num if n == 1
  return 1 if n == 0
  multiply(num, power(num, n - 1))
end

puts square(5) == 25
puts square(-8) == 64
puts power(2,3) == 8
puts power(2,0) == 1
