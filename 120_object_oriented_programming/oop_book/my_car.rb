# my_car.rb

module Towable
  def tow_load(load)
    puts "The #{load} has been towed!"
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(miles, gallons)
    puts "#{(miles / gallons)} miles per gallon"
  end

  attr_reader :year, :model
  attr_accessor :color, :current_speed

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def gas(num)
    self.current_speed += num
  end

  def brake(num)
    self.current_speed -= num
  end

  def shut_down
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def age
    calculate_age
  end

  private

  def calculate_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{color}, #{year} #{model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{color}, #{year} #{model}!"
  end
end

lumina = MyCar.new(1997, 'Chevy Lumina', 'white')
lumina.gas(20)
puts lumina.current_speed
lumina.gas(20)
puts lumina.current_speed
lumina.brake(20)
puts lumina.current_speed
lumina.brake(20)
puts lumina.current_speed
lumina.shut_down
puts lumina.current_speed
puts lumina.color
lumina.spray_paint('red')
puts lumina.color
puts lumina
puts Vehicle.number_of_vehicles
ford =  MyTruck.new(2008, 'Ford F-150', 'black')
puts ford
puts Vehicle.number_of_vehicles
ford.tow_load('rocks')
puts MyTruck.ancestors

puts ford.age