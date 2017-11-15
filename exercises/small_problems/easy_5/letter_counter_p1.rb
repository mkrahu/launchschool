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

p word_sizes('Four score and seven.')