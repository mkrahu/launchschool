# arithmetic_integer.rb
# Arithmetic Integer exercise
# Small Problems exercises from LaunchSchool

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number: ")
first_number = $stdin.gets.chomp.to_i

prompt("Enter the second number: ")
second_number = $stdin.gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number ** second_number}")