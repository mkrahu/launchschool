# sum_or_product.rb
# Sum or Product of Consecutive Integers exercise
# Small Problems exercises from LaunchSchool

print "Please enter an integer greater than 0: "
number = $stdin.gets.chomp.to_i

print "Enter 's' to compute the sum, 'p' to compute the product: "
sum_or_product = $stdin.gets.chomp

if sum_or_product == 's'
  total = (1..number).inject(:+)
  calc = 'sum'
elsif sum_or_product == 'p'
  total = (1..number).inject(:*)
  calc = 'product'
end

puts "The #{calc} of the integers between 1 and #{number} is #{total}."