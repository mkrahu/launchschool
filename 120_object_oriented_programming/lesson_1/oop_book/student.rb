# student.rb

class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    @grade > other_student.grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)