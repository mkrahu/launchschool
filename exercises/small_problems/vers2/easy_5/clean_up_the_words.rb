# clean_up_the_words.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def cleanup(str)
  str.gsub(/[^a-z]+/i,' ')
end

# test cases
p cleanup("---what's my +*& line?") == ' what s my line '