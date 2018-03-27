# searching_101.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def ordinal(n)
  ending = case n % 100
           when 11, 12, 13 then 'th'
           else
             case n % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end

  "#{n}#{ending}"
end

num_arr = []

1.upto(5) do |num|
  print "Enter the #{ordinal(num)} number: "
  num_arr << $stdin.gets.chomp.to_i
end

print 'Enter the last number: '
last_num = $stdin.gets.chomp.to_i

if num_arr.include?(last_num)
  puts "The number #{last_num} appears in #{num_arr.inspect}."
else
  puts "The number #{last_num} does not appear in #{num_arr.inspect}."
end