# mult_signatures.rb 
# Multiple Signatures exercise
# Ruby Basics exercises from LaunchSchool

a = %w(a b c d e)
#puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |i| i ** 2 }