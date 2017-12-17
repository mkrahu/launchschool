# letter_swap.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def swap(str)
  str.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

# test cases
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'