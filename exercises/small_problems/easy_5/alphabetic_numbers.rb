# alphabetic_numbers.rb
# Alphabetic Numbers exercise
# Small Problems exercises from LaunchSchool

ALPHABETIC_NUMBER = [ 'zero', 'one', 'two', 'three', 'four', 
                      'five', 'six', 'seven', 'eight', 'nine', 'ten',
                      'eleven', 'twelve', 'thirteen', 'fourteen',
                      'fifteen', 'sixteen', 'seventeen', 'eighteen', 
                      'nineteen']


def alphabetic_number_sort(arr)
  arr.sort_by { |a| ALPHABETIC_NUMBER[a] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

puts "Further exploration:"
def alphabetic_number_sort2(arr)
  arr.sort { |a,b| ALPHABETIC_NUMBER[a] <=> ALPHABETIC_NUMBER[b] }
end

p alphabetic_number_sort2((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]