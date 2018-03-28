# good_dog.rb

class GoodDog
  DOG_YEARS = 7

  @@number_of_dogs = 0

  attr_accessor :name, :height, :weight
  attr_reader :age

  def initialize(name, height, weight, age)
    @@number_of_dogs += 1
    self.name = name
    self.height = height
    @weight = weight
    self.age = age
  end

  def self.number_of_dogs
    @@number_of_dogs
  end

  def age=(n)
    @age = n * DOG_YEARS
  end

  def change_info(n, h, w, a)
    self.name = n
    self.height = h
    self.weight = w
    self.age = a
  end

  def speak
    "#{name} says arf!"
  end


  def to_s
    "#{name} weighs #{weight} is #{height} tall and #{age} dog years old."
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs', 4)
puts sparky.speak
#puts sparky.info
puts sparky

sparky.change_info('Fido', '24 inches', '45 lbs',6)
puts sparky
p sparky

puts GoodDog.number_of_dogs
