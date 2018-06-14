birds = %w(raven finch hawk eagle)

def raptors(birds)
  yield(birds)
end

raptors(birds) do | _, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end