# exercise1.rb 
# Exercises for chapter 'Hashes' in LaunchSchool Intro To Programming Ruby

family = {
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank", "rob", "david"],
  aunts: ["mary", "sally", "susan"]
}

puts "One way:"

immediate_family = family.select do |k,v|
  k == :sisters || k == :brothers
end

arr = immediate_family_2.values.flatten

p arr

puts "Another way:"
immediate_fam = []

family.each do |group,names|
  immediate_fam += names if group == :sisters || group == :brothers
end

p immediate_fam

