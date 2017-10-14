# divide.rb 
# Exercises from Other Stuff chapter Intro to Programming LaunchSchool

def divide(a,b)
  begin
    answer = a / b
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16,4)
puts divide(4,0)
puts divide(14,7)