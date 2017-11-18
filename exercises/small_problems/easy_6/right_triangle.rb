# right_triangle.rb
# Right Triangle exercise
# Small Problems exercises from LaunchSchool


def triangle(num)
  spaces = num - 1
  stars = 1
  num.times do 
    puts ' ' * spaces  + '*' * stars 
    stars += 1
    spaces -= 1
  end
end

triangle(9)
puts 

puts "Another way: "
def triangle2(num)
  num.times { |n| puts ' ' * (num - n - 1)  + '*' * (n + 1) } 
end

triangle2(4)
