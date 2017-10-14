# exception_example.rb 
# Exercises from Other Stuff chapter Learning to Program LaunchSchool

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s length is #{name.length} letters long."
  rescue
    puts "Something went wrong!"
  end
end