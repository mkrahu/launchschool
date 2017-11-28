# matching_parentheses.rb
# Matching Parentheses exercise
# Small Problems exercises from LaunchSchool

def balanced?(string)
  parentheses = 0
  string.chars.each do |char|
    case char
    when '('
      parentheses += 1
    when ')'
      parentheses -= 1
      break if parentheses < 0
    end
  end
  parentheses.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
