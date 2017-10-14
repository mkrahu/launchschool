# exercise1.rb 
# Exercises from Other Stuff chapter of Intro to Programming LaunchSchool

def contains_lab(word)
  puts word if word =~ /lab/
end

contains_lab("laboratory")
contains_lab("experiment")
contains_lab("Pans Labyrinth")
contains_lab("elaborate")
contains_lab("polar bear")