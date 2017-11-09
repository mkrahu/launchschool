# additional_practice_9.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

words = "the flintstones rock"

def titleize(string)
  string.split.map { |s| s.capitalize }.join(' ')
end

puts words
puts titleize(words)
