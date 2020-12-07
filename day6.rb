# https://adventofcode.com/2020/day/6

# Part 1

def anyone_answers(group_answers)
  group_answers.gsub(/\s+/, '').split('').uniq.count
end

# Part 2

def everyone_answers(group_answers)
  peoples_count = group_answers.split("\n").count
  group_answers.gsub(/\s+/, '').split('').tally.select { |_k, v| v == peoples_count }.count
end
