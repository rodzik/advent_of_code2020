# https://adventofcode.com/2020/day/7

# Process input
# Transform input into more programmers friendly format
# ["striped indigo"=>{"wavy red"=>3, "posh white"=>5, "light tan"=>5, "plaid bronze"=>1}, ...]

def content(colors)
  return {} if colors[-2].include?('no other')

  content = {}
  color_list = colors.filter_map { |w| w.split(' ')[-3..-1]&.join(' ') }
  color_list.map do |c|
    splitted = c.split(' ')
    content[splitted[1, 2].join(' ')] = splitted[0].to_i
  end
  content
end

lines = File.open('day7.txt').read.split("\n")
bag_map = {}
lines.each do |line|
  colors = line.split(' bag')
  bag_map[colors[0]] = content(colors)
end

# Part 1

def count_bags(bag_map, colors)
  count_bags_helper(bag_map, colors).uniq.count
end

def count_bags_helper(bag_map, colors)
  bags = bag_map.reject { |_k, v| (v.keys & colors).empty? }.keys

  return [] if bags.count.zero?

  bags + count_bags_helper(bag_map, bags)
end

puts count_bags(bag_map, ['shiny gold'])

# Part 2

def count_bags_inside(bag_map, color)
  bag_map[color].values.sum + bag_map[color].map { |k, v| v * count_bags_inside(bag_map, k) }.sum
end

puts count_bags_inside(bag_map, 'shiny gold')
