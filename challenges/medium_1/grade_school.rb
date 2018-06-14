# School class for storing students and their grades

# grade_school.rb
class School
  def initialize
    @school = {}
  end

  def to_h
    school.sort.map { |grade, students| [grade, students.sort] }.to_h
  end

  def add(student, grade)
    if school[grade].nil?
      school[grade] = [student]
    else
      school[grade] << student
    end
  end

  def grade(num)
    school[num].nil? ? [] : school[num]
  end

  private

  attr_reader :school
end
