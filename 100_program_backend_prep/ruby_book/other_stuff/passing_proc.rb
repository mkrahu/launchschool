# passing_proc.rb 
# Exercises from Other Stuff chapter Intro to Programming LaunchSchool

def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc_ex = Proc.new do |number|
    puts "This is a proc being called as a method passed a #{number}"
  end

  take_proc(proc_ex)