numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8] #using the incorrect method on line 3, should use select instead of map and adjust
# the block slightly

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers