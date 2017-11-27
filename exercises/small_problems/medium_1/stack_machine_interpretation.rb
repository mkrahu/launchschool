# stack_machine_interpretation.rb
# Stack Machine Interpretation exercise
# Small Problems exercises from LaunchSchool


def mini_command(command)
  
end

def minilang(commands)
  stack = []
  register = 0

  commands_arr = commands.split

  commands_arr.each do |step|
    if step.to_i.to_s == step
      register = step.to_i
    else
      case step
        when 'PUSH'
          stack.push(register)
        when 'ADD'
          register += stack.pop
        when 'SUB'
          register -= stack.pop
        when 'MULT'
          register *= stack.pop
        when 'DIV'
          register /= stack.pop
        when 'MOD'
          register %= stack.pop
        when 'POP'
          register = stack.pop
        when 'PRINT'
          puts register
        else
          puts "ERROR: #{command} is not a valid command!"
      end
    end
  end
end

#minilang('PRINT')
#minilang('5 PUSH 3 MULT PRINT')
#minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
#minilang('5 PUSH POP PRINT')
#minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
#minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
#minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
#minilang('-3 PUSH 5 SUB PRINT')
#minilang('6 PUSH')
