# username_and_password.rb
# User Name and Password exercise
# Ruby Basics exercises from LaunchSchool

USERNAME = 'mkrahu'
PASSWORD = "HelloWorld!"

loop do
  print "Please enter your username: "
  username = $stdin.gets.chomp.downcase
  
  print "Please enter the password: "
  password = $stdin.gets.chomp

  break if password == PASSWORD && username == USERNAME
  puts "Invalid username/password combination"
end
puts "Welcome!"