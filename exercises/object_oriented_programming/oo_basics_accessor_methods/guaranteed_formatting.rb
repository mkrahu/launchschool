#!/usr/bin/env ruby -wKU
# guaranteed_formatting.rb

class Person
  attr_reader :name

  def name=(n)
    @name = n.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name