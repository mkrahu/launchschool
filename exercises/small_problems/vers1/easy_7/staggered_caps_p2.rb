# staggered_caps_p2.rb
# Staggered Caps (Part 2) exercise
# Small Problems exercises from LaunchSchool

def staggered_case1(str)
  staggered_chars = str.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end
  staggered_chars.join
end

def staggered_case(str, method: 'default')
  if method == 'default'
    toggle_upper = true
    staggered_chars = str.chars.map do |char|
      if char =~ /[a-zA-Z]/
        if toggle_upper == true
          toggle_upper = !toggle_upper
          char.upcase
        elsif toggle_upper == false
          toggle_upper = !toggle_upper
          char.downcase
        end
      else
        char
      end
    end
    staggered_chars.join
  elsif method == 'all'
    staggered_case1(str)
  end
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', method: 'all') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', method: 'all') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', method: 'all') == 'IgNoRe 77 ThE 444 NuMbErS'
