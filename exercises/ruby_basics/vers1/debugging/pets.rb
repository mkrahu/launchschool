pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser' # Need to append 'bowser' to the end of the array at 'dogs' in the pets hash, rather than replace it

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}