# lettercase_percentage_ratio.rb
# Lettercase Percentage Ratio exercise
# Small Problems exercises from LaunchSchool

def letter_percentages(sentence)
  lowercase = 0
  uppercase = 0
  neither = 0
  length = sentence.length

  sentence.chars.each do |char|
    case char
    when 'a'..'z' then lowercase += 1
    when 'A'..'Z' then uppercase += 1
    else neither += 1
    end
  end
  
  { lowercase: (lowercase * 100 / length),
    uppercase: (uppercase * 100 / length),
    neither: (neither * 100 / length) }
end

p letter_percentages('abCdef 123')


def letter_percentages2(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages2('abCdef 123')