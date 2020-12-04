# https://adventofcode.com/2020/day/3

# Part 1

def tree_count(map, slope)
  width = map.first.length
  height = map.count
  tree_counter = 0
  x = 0
  y = 0

  while y < height - 1
    x = (x + slope[0]) % width
    y += slope[1]
    tree_counter += 1 if map[y][x] == '#'
  end

  tree_counter
end

# Part 2

def multiple_routes_tree_counter(map, slopes)
  slopes.map { |slope| tree_count(map, slope) }.reduce(&:*)
end
