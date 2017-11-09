# additional_practice_3.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |name, age| age < 100 }
p ages