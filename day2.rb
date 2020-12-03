# https://adventofcode.com/2020/day/2

# Part 1

def valid?(string)
  splitted = string.split(' ')
  min = splitted[0].split('-')[0].to_i
  max = splitted[0].split('-')[1].to_i
  char = splitted[1][0]
  password = splitted[2]

  password.split('').tally[char]&.between?(min, max)
end

# Part 2

def new_valid?(string)
  splitted = string.split(' ')
  first = splitted[0].split('-')[0].to_i - 1
  second = splitted[0].split('-')[1].to_i - 1
  char = splitted[1][0]
  password = splitted[2].split('')

  (password[first] == char) ^ (password[second] == char)
end
