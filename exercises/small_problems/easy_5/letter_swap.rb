# letter_swap.rb
# Letter Swap exercise
# Small Problems exercises from LaunchSchool

def swap(str)
  str_split = str.split
  str_split.each do |str|
    str[-1], str[0] = str[0], str[-1]
  end
  str_split.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

puts "Further exploration"
# Further exploration
def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap2(str)
  str_split = str.split
  str_split.each do |str|
    swap_first_last_characters(str[0],str[-1])
  end
  str_split.join(' ')
end

puts swap2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'

# doesn't work because regular assignment does not mutate the caller
