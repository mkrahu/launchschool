class Employee
  attr_reader :name, :serial_number, :desk, :type
  attr_accessor :vacation_days
  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
    @desk = 'None'
  end

  def to_s
    ["Name: #{name}", "Type: #{self.class}", "Serial number: #{serial_number}",
    "Vacation days: #{vacation_days}", "Desk: #{desk}"].join("\n")
  end
end

class PartTimeEmployee < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 0
    @desk = 'open space'
    @type = 'part-time'
  end
end

class RegularEmployee < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 10
    @desk = 'cubicle farm'
    @type = 'full-time'
  end

  def take_vacation(days)
    self.vacation -= days
  end
end

class Manager < RegularEmployee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 14
    @desk = 'private office'
  end

  def delagate
    puts "Please do this for me!"
  end
end

class Executive < Manager
  def initialize(name, serial_number)
     super(name, serial_number)
     @vacation_days = 20
     @desk = 'corner office'
  end
end

exec = Manager.new('Mike', 123)
p exec
