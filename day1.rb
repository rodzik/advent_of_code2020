# https://adventofcode.com/2020/day/1

# Part 1

def two_sum(array, target)
  cache = {}
  array.each do |n|
    return [n, cache[n]] if cache[n]

    cache[target - n] = n
  end
end

# Part 2

def three_sum(array, target)
  sorted_array = array.sort

  sorted_array.length.times do |i|
    left = i + 1
    right = sorted_array.length - 1
    while left < right
      sum = sorted_array[i] + sorted_array[left] + sorted_array[right]
      return [sorted_array[i], sorted_array[left], sorted_array[right]] if sum == target

      if sum < target
        left += 1
      else
        right -= 1
      end
    end
  end
end

