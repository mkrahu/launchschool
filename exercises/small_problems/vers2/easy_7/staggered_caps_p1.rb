# staggered_caps_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def staggered_case(str)
  str.chars.map.with_index { |element, index| index.even? ? element.upcase : element.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'