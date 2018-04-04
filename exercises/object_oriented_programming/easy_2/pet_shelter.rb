#!/usr/bin/env ruby -wKU
# pet_shelter.rb

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Shelter
  def initialize
    @adoptions = {}
    @pets = []
  end

  def adopt(owner, pet)
    if @adoptions[owner]
      @adoptions[owner] << pet
    else
      @adoptions[owner] = [ pet ]
    end
    owner.number_of_pets += 1
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end

  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each do |pet|
        puts pet
      end
      puts
    end
  end

  def print_unadopted_pets
    puts "The Shelter has the following unadopted pets:"
    @pets.each do |pet|
      puts pet
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
tova         = Pet.new('dog', 'Tova')
sully        = Pet.new('dog', 'Sully')
moose        = Pet.new('cat', 'Moose')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
mkrahulec = Owner.new('M Krahulec')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(mkrahulec, tova)
shelter.adopt(mkrahulec, sully)
shelter.adopt(mkrahulec, moose)
shelter.add_pet(asta)
shelter.add_pet(laddie)
shelter.add_pet(fluffy)
shelter.add_pet(kat)
shelter.add_pet(ben)
shelter.add_pet(chatterbox)
shelter.add_pet(bluebell)

shelter.print_unadopted_pets
shelter.print_adoptions


puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.number_of_pets} unadopted pets."