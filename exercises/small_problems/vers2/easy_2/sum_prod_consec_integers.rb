# sum_prod_consec_integers.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

number = nil
operation = nil

loop do
  print "Please enter an integer greater than zero: "
  number = $stdin.gets.chomp.to_i
  break if number > 0
end

loop do
  print "Enter 's' to compute the sum, or 'p' to compute the product: "
  operation = $stdin.gets.chomp
  break if ['s','p'].include?(operation)
end

total = case operation
        when 's' then (1..(number)).inject(:+)
        when 'p' then (1..(number)).inject(:*)
        end

operation_full = operation == 's' ? 'sum' : 'product'
puts "The #{operation_full} of the integers between 1 and #{number} is #{total}."