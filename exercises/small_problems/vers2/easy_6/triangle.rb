# triangle.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def triangle(num)
  index = 1
  until index > num
    puts ' ' * (num - index) + '*' * (index)
    index += 1
  end
end

triangle(5)
triangle(9)