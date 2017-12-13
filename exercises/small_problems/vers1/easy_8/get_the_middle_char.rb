# get_the_middle_char.rb
# Get The Middle Character exercise
# Small Problems exercises from LaunchSchool

def center_of(str)
  middle = str.length / 2
  str.length.odd? ? str[middle] : str[(middle - 1)..middle]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
