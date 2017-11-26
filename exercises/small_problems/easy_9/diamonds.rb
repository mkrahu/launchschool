# diamonds.rb
# Diamonds! exercise
# Small Problems exercises from LaunchSchool

def display_diamonds(num, n)
  space = ' ' * ((num - n) / 2)
  diamonds = '*' * n
  space + diamonds + space
end

def diamonds(num)
  diamonds = ((1..num).to_a + (1..(num - 1)).to_a.reverse).select { |n| n.odd? }
  diamonds.each { |n| puts display_diamonds(num,n) }
end

diamonds(9)