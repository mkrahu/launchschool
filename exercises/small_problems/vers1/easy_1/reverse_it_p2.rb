# reverse_it_p2.rb
# Reverse It (Part 2) exercise
# Small Problems exercises from LaunchSchool

def reverse_words(sentence)
  reverse = sentence.split.map do |word| 
    word.length >= 5 ? word.reverse : word 
  end
  reverse.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS