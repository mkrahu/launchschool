# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase


player.merge!(character_classes[input.to_sym]) # need to use #to_sym to turn input into symbol to match character_classes keys
  # also need to use merge! instead of merge to correctly mutate the original hash

puts 'Your character stats:'
puts player
