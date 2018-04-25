# counting_cats.rb

class Cat
  @@count_of_cats = 0

  def self.total
    puts @@count_of_cats
  end

  def initialize
    @@count_of_cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total