# multiples_of_3_and_5.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def multisum(num)
  1.upto(num).select { |n| n % 3 == 0 || n % 5 == 0 }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
