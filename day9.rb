# https://adventofcode.com/2020/day/9

# Process input

list = File.open('day9.txt').read.split("\n").map(&:to_i)

# Part 1

def two_sum(array, target)
  cache = {}
  array.each do |n|
    return true if cache[n]

    cache[target - n] = n unless target == 2 * n
  end

  false
end

def find_invalid(list, preambule_length)
  (preambule_length...list.length).each do |n|
    return n unless two_sum(list[(n - preambule_length)...n], list[n])
  end
end

# Part 2

def find_set(list, invalid_index)
  target = list[invalid_index]
  left = 0
  right = 1
  sum = list[left..right].sum
  while sum != target
    if sum < target
      right += 1
    else
      left += 1
    end
    sum = list[left..right].sum
  end

  list[left..right].minmax.sum
end
