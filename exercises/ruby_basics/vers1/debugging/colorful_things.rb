colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= colors.length || i >= things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# We need to adjust the break to look at the length of both colors and things as one array can be shorter than the other.
# We also need to make sure to break if the index is greater than OR equal to the size of the array as array's are zero-indexed
# and looking for arr[arr.length] will be one greater than the largers assigned index