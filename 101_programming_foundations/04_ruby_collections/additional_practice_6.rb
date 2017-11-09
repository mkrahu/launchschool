# additional_practice_6.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! {|name| name[0,3] }