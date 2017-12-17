# bannerizer.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def print_in_box(str)
  space_length = str.length + 2
  puts '+' + '-' * space_length + '+'
  puts '|' + ' ' * space_length + '|'
  puts '| ' + str +  ' |'
  puts '|' + ' ' * space_length + '|'
  puts '+' + '-' * space_length + '+'
end

# test cases
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
