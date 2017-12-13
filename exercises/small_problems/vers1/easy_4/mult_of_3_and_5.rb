# mult_of_3_and_5.rb
# Multiples of 3 and 5 exercise
# Small Problems exercises from LaunchSchool

def multisum(num)
  sum = 0
 (1..num).each do |n|
    sum += n if (n % 3 == 0 ) || (n % 5 == 0)
  end
  sum
end

def multisuminject(num)
  (1..num).inject(0) do |sum, n| 
    if (n % 3 == 0 ) || (n % 5 == 0)
      sum + n
    else
      sum
    end
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

puts multisuminject(3) == 3
puts multisuminject(5) == 8
puts multisuminject(10) == 33
puts multisuminject(1000) == 234168