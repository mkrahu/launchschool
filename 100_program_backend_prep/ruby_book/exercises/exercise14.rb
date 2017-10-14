# exercise14.rb 
# Final exercises from the Intro to Programming LaunchSchool book

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |contact,hash|
  hash[:email] = contact_data.first.shift
  hash[:address] = contact_data.first.shift
  hash[:phone] = contact_data.first.shift
  contact_data.shift
end

p contacts