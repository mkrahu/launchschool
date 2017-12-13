# searching_101.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

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

numbers_arr = []
5.times do |num|
  print "Enter the #{ordinal(num + 1)} number: "
  numbers_arr << $stdin.gets.chomp.to_i
end

print "Enter the last number: "
last_num = $stdin.gets.chomp.to_i
if numbers_arr.include?(last_num)
  puts "The number #{last_num} appears in #{numbers_arr}"
else
  puts "The number #{last_num} does not appear in #{numbers_arr}"
end
