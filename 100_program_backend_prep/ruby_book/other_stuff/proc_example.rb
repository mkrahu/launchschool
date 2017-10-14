# proc_example.rb 
# Exercises from Other Stuff chapter in Intro to Programming LaunchSchool

proc = Proc.new do
  puts "This is a proc!"
end

proc.call

proc2 = Proc.new do |name|
  puts "Hi, #{name}! This proc knows your name!"
end

proc2.call "Mike"