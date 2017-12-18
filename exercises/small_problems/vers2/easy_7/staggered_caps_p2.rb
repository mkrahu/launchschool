# staggered_caps_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def staggered_case(str)
  toggle = true
  swapped_chars = str.chars.map do |char|
    changed_char = ''
    if char =~ /[a-z]/i
      changed_char = toggle ? char.upcase : char.downcase
      toggle = !toggle
    else
      changed_char = char
    end
    changed_char
  end
  swapped_chars.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'