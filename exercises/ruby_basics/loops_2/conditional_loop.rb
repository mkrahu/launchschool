# conditional_loop.rb
# Conditional Loop exercise
# Ruby Basics exercises from LaunchSchool

puts "One way:"
loop do 
  process_the_loop = [true, false].sample
  puts process_the_loop ? "The loop was processed!" : "The loop wasn't processed!"
  break if process_the_loop
end

puts "Another way:"

process_the_loop = [true, false].sample
if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end