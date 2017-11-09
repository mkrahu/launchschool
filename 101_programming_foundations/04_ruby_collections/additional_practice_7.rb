# additional_practice_7.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

statement = "The Flintstones Rock"

letters_hash = Hash.new(0)
statement.split.join.chars.each do |char|
  letters_hash[char] += 1
end

p letters_hash