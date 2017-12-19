# grade_book.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def get_grade(grade1, grade2, grade3)
  average_grade = (grade1 + grade2 + grade3) / 3

  case average_grade
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"