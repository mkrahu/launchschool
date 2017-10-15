# count_sheep_p3.rb
# Count Sheep (Part 3) exercise
# Ruby Basics exercises from LaunchSchool

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep