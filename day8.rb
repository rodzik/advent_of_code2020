# https://adventofcode.com/2020/day/8

# Process input

commands = File.open('day8.txt').read.split("\n").map do |cmd|
  {
    cmd: cmd.split(' ')[0],
    value: cmd.split(' ')[1].to_i,
    visited: false
  }
end

# Part 1

def accumulate(commands)
  i = 0
  accumulator = 0
  finished = false

  until finished || commands[i][:visited]
    commands[i][:visited] = true
    case commands[i][:cmd]
    when 'nop' then i += 1
    when 'jmp' then i += commands[i][:value]
    else
      accumulator += commands[i][:value]
      i += 1
    end

    finished = true if i >= commands.count
  end

  { acc: accumulator, finished: finished }
end

# Part 2
# Brute force solution

def replace(command)
  command[:cmd] = command[:cmd] == 'nop' ? 'jmp' : 'nop'
end

def replace_and_accumulate(commands)
  replace_pointer = 0
  finished = false
  until finished
    replecable_command = commands[replace_pointer]
    if replecable_command[:cmd] != 'acc'
      replace(replecable_command)
      result = accumulate(commands)
      finished = result[:finished]
      replace(replecable_command)
      commands.each { |c| c[:visited] = false }
    end
    replace_pointer += 1
  end

  result[:acc]
end
