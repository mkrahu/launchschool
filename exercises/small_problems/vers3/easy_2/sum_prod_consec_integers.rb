# sum_prod_consec_integers.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

print 'Please enter an integer greater than 0: '
num = $stdin.gets.chomp.to_i

loop do 
  print "Enter 's' to compute the sum, 'p' to compute the product: "
  operation = $stdin.gets.chomp

  if operation.downcase == 's'
    sum = 1.upto(num).inject(0) { |sum, num| sum + num }
    puts "The sum of integers between 1 and #{num} is #{sum}"
    break
  elsif operation.downcase == 'p'
    product = 1.upto(num).inject(1) { |product, num| product * num }
    puts "The product of integers between 1 and #{num} is #{product}"
    break
  end
  puts "Please enter 's' or 'p'"
end