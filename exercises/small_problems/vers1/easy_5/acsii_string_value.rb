# ascii_string_value.rb
# ASCII String Value exercise
# Small Problems exercises from LaunchSchool

def ascii_value(str)
  accum_arr = str.chars.map { |char| char.ord }  
  accum_arr.inject(0,:+)
end

def ascii_value_2(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

puts "One way:"
puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

puts "Another way:"
puts ascii_value_2('Four score') == 984
puts ascii_value_2('Launch School') == 1251
puts ascii_value_2('a') == 97
puts ascii_value_2('') == 0