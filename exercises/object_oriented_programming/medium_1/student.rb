#!/usr/bin/env ruby -wKU
# student.rb

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < student
  def initialize(name, year)
    super
  end
end