# letter_counter_p1.rb
# Letter Counter (Part 1) exercise
# Small Problems exercises from LaunchSchool

def word_sizes(str)
  word_counter = Hash.new(0)
  str.split.each do |word|
    word_counter[word.length] += 1
  end
  word_counter.sort.to_h
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
