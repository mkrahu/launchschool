# additional_practice_10.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts "One way:"
munsters.each do |name, info|
  if info["age"] >= 65
    info["age_group"] = "senior"
  elsif info["age"] >= 18
    info["age_group"] = "adult"
  else
    info["age_group"] = "kid"
  end 
end

p munsters

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts "Another way:"

munsters.each do |name, info|
  case info["age"]
  when 0...18
    info["age_group"] = "kid"
  when 18...65
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

p munsters