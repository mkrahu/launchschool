# staggered_caps_p1.rb
# Staggered Caps (Part 1) exercise
# Small Problems exercises from LaunchSchool

def staggered_case(str)
  staggered_chars = str.chars.map.with_index  do |char,index| 
    index.even? ? char.upcase : char.downcase
  end
  staggered_chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further exploration

def swapcase(str)
  swapped_chars = str.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  swapped_chars.join
end

def staggered_case2(str, up_first = true)
  staggered_chars = str.chars.map.with_index  do |char,index| 
    index.even? ? char.upcase : char.downcase
  end
  if up_first
    staggered_chars.join
  else
    swapcase(staggered_chars.join)
  end
end

p staggered_case2('I Love Launch School!')
p staggered_case2('I Love Launch School!', false)

