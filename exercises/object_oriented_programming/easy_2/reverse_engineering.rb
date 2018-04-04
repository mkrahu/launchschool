#!/usr/bin/env ruby -wKU
# reverse_engineering.rb

class Transform
  def self.lowercase(text)
    text.downcase
  end

  def initialize(text)
    @text = text
  end

  def uppercase
    @text.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')