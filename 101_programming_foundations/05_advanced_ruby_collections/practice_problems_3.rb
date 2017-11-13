# practice_problems_3.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
g1 = arr1[2][1][-1]
puts "arr1: #{g1}"

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
g2 = arr2[1][:third][0]
puts "arr2: #{g2}"

arr3 = [['abc'], ['def'], {third: ['ghi']}]
g3 = arr3[2][:third][0][0]
puts "arr3: #{g3}"

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
g4 = hsh1['b'][1]
puts "hsh1: #{g4}"

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
g5 = hsh2[:third].keys[0]
puts "hsh2: #{g5}"
