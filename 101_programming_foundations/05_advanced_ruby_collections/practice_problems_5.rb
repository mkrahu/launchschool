# practice_problems_5.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts "One way"
munster_male_age = 0
munsters.keys.each do |munster|
  if munsters[munster]["gender"] == "male"
    munster_male_age += munsters[munster]["age"]
  end
end
puts "Accumulative age of male munsters: #{munster_male_age}"

puts "Another way"
munster_male_age = 0
munsters.each_value do |value|
  munster_male_age += value["age"] if value["gender"] == "male"
end
puts "Accumulative age of male munsters: #{munster_male_age}"