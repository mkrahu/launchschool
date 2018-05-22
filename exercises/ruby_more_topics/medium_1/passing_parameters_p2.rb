# passing_parameters_p2.rb

birds = %w(raven finch hawk eagle osprey)

def bird_types(arr)
  raptors = yield(arr)
  puts "Raptors: #{raptors.join(', ')}"
end

bird_types(birds) { |bird_arr| bird_arr[2..-1] }

def bird_types2(arr)
  yield(arr)
end

bird_types2(birds) { |_,_,*raptors| puts "Raptors: #{raptors.join(', ')}" }