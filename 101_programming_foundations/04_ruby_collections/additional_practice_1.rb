# additional_practice_1.rb
# Additional Practice exercise
# Practice Problems from Ruby Collections chapter from LaunchSchool

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |flintstone, index|
  flintstones_hash[flintstone] = index
end

p flintstones_hash