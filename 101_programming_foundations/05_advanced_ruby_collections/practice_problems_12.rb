# practice_problems_12.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [ [:a, 1], 
        ['b', 'two'], 
        ['sea', {c: 3}], 
        [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}

arr.each do |subarr|
  hsh[subarr[0]] = subarr[1]
end

p hsh