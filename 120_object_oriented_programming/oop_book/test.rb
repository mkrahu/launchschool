#!/usr/bin/ruby
class Person
  attr_writer :first_name, :last_name

  def change_name=(name)
    self.first_name = name
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
mike.change_name = 'Mike'
p mike