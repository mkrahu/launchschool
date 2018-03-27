# reverse_p2.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def reverse_words(str) 
  str.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS