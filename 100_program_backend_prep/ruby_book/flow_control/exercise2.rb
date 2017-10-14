def upper_case_more_10(string)
  if string.length > 10
    string.upcase 
  else
    string
  end
end

puts upper_case_more_10("hello world")
puts upper_case_more_10("hello")