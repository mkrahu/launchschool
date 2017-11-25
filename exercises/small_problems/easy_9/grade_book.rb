# grade_book.rb
# Grade book exercise
# Small Problems exercises from LaunchSchool

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  case average_score
    when 0...60 then 'F'
    when 60...70 then 'D'
    when 70...80 then 'C'
    when 80...90 then 'B'
    when 90..100 then 'A'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"