# additional_practice_5.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index {|name| name =~ /^Be/ }
