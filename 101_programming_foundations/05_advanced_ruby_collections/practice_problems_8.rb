# practice_problems_8.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

hsh = { first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog'] }

hsh.values.each do |arr|
  arr.each do |word|
    word.chars.each do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end