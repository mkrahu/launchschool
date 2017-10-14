# passwords.rb
# Passwords exercise
# Ruby Basics exercises from LaunchSchool

PASSWORD = "HelloWorld!"

loop do
  print "Please enter the password: "
  password = $stdin.gets.chomp
  break if password == PASSWORD
  puts "Invalid password!"
end
puts "Welcome!"