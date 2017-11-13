# practice_problems_16.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

# 0-9 & a-f
# 8-4-4-4-12 

def generate_chars(num, chars)
  return_chars = ''
  num.times { return_chars += chars.sample.to_s }
  return_chars
end


def generate_uuid
  format = [8,4,4,4,12]

  possible_chars = []
  for i in 0..9
    possible_chars << i
  end

  for a in 'a'..'f'
    possible_chars << a
  end

  uuid = ''
  format.each_with_index do |num, index|
    uuid += generate_chars(num,possible_chars)
    uuid += '-' unless index == format.size - 1
  end
  uuid
end

p generate_uuid
