# broken_odometer.rb
# Broken Odometer exercise
# Ruby Basics exercises from LaunchSchool

car = { type: 'sedan', color: 'blue', mileage: 80_000 }

car[:year] = 2003

car.delete(:mileage)
p car