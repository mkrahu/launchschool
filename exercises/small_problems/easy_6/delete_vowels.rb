# delete_vowels.rb
# Delete vowels exercise
# Small Problems exercises from LaunchSchool

def remove_vowels(str)
  str.map do |s|
    s.delete("aeiouAEIOU")
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']