# seeing_stars.rb
# Seeing Stars exercise
# Small Problems exercises from LaunchSchool

def star(n)
  stars = Array.new(n) { Array.new(n, ' ') }

  stars.each_with_index do |arr, index|
    arr[index] = '*'
    arr[(n-1) - index] = '*'
    arr[n / 2] = '*'
  end
  stars[n / 2].map! { '*' }
  stars.each {|arr| puts arr.join }
end

star(13)