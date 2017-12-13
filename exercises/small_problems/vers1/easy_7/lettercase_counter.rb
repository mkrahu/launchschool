# lettercase_counter.rb
# Lettercase Counter exercise
# Small Problems exercises from LaunchSchool

def letter_case_count(str)
  letter_count = {}
  letter_count[:lowercase] = str.count('a-z')
  letter_count[:uppercase] = str.count('A-Z')
  letter_count[:neither] = str.count('^a-zA-z')
  letter_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
