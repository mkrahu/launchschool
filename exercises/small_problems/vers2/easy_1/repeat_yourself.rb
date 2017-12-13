# repeat_yourself.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def repeat(str, num)
  num.times { puts str }
end

repeat('Hello', 3)

def repeat2(str, num)
  num.times { |n| puts "#{n}:#{str}" }
end

repeat2('Hello', 3)