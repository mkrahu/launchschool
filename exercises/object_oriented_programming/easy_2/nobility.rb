#!/usr/bin/env ruby -wKU
# nobility.rb


module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    @title = title
    super(name)
  end

  def gait
    "struts"
  end

  def walk
    "#{title} #{name} #{gait} forward"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk