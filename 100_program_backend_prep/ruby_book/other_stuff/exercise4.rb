# exercise4.rb
# Exercise from Other Stuff chapter of Intro to Programming LaunchSchool

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method" }