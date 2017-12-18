# get_the_middle_character.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def center_of(str)
  case 
  when str.length.even?
    middle = (str.length / 2) - 1
    str[middle,2]
  when str.length.odd?
    middle = (str.length / 2)
    str[middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'