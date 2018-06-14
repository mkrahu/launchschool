# from_to_step_sequence_generator.rb

def step(from, to, step_amount)
  index = from
  while index <= to
    yield(index)
    index += step_amount
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }