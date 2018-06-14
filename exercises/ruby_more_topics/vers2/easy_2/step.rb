def step(first, last, step_by)
  index = first
  while index <= last
    yield(index)
    index += step_by
  end
  last
end


step(1, 10, 3) { |value| puts "value = #{value}" }