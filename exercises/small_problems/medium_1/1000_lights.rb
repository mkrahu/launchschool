# 1000_lights.rb
# 100 Lights exercise
# Small Problems exercises from LaunchSchool

def toggle_light(lights, n)
  lights[n] = !lights[n]
end
def n_lights(num)
  lights = []
  num.times { lights << false }

  1.upto(num) do |i|
    0.upto(num - 1) do |n|
      toggle_light(lights, n) if ((n + 1) % i).zero?
    end
  end
  lights_to_num = lights.map.with_index { |light, index| index + 1 if light }
  lights_to_num.select { |light| light }
end

p n_lights(5)
p n_lights(10)
p n_lights(1000)