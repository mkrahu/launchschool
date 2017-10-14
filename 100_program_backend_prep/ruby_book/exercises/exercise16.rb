# exercise16.rb
# Final exercises from the Intro to Programming LauncSchool book
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

new_a = a.map { |e| e.split(' ') }.flatten

p new_a