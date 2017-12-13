# triangle_sides.rb
# Triangle Sides exercise
# Small Problems exercises from LaunchSchool

def triangle(a, b, c)
  sorted = [a, b, c].sort

  if sorted[0] + sorted[1] < sorted[2] || sorted.include?(0)
    :invalid
  elsif sorted[0] == sorted[1] && sorted[1] == sorted[2]
    :equilateral
  elsif sorted[0] == sorted[1]|| sorted[1] == sorted[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid