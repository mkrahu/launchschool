# bannerizer.rb
# Bannerizer exercise
# Small Problems exercises from LaunchSchool

def print_in_box(str)
  str = str.length > 80 ? "#{str[0...80]}" : str # further exploration
  str_length = str.length
  line_width = str_length + 2

  puts "+" + "-" * line_width + "+"
  puts "|" + " " * line_width + "|"
  puts "| " + str + " |"
  puts "|" + " " * line_width + "|"
  puts "+" + "-" * line_width + "+"
end

print_in_box('')
print_in_box("a"*80 + "hello")