# https://adventofcode.com/2020/day/12

# Load input
input = File.open('day12.txt').read

def commands(input)
  input.split("\n").map { |c| { cmd: c[0], value: c[1..-1].to_i } }
end

# Part 1
def part_1(input)
  ship = [0, 0, 'E']

  commands(input).each do |cmd|
    case cmd[:cmd]
    when 'N', 'E', 'S', 'W' then move_ship(ship, cmd[:cmd], cmd[:value])
    when 'F' then move_ship(ship, ship[2], cmd[:value])
    else rotate_ship(ship, cmd)
    end
  end

  ship[0..1].map(&:abs).sum
end

def move_ship(ship, dir, value)
  case dir
  when 'N' then ship[1] += value
  when 'S' then ship[1] -= value
  when 'E' then ship[0] += value
  when 'W' then ship[0] -= value
  end
end

def rotate_ship(ship, cmd)
  directions = %w[N E S W]

  ship[2] = if cmd[:cmd] == 'L'
              directions[directions.find_index(ship[2]) - (cmd[:value] / 90)]
            else
              directions[(directions.find_index(ship[2]) + (cmd[:value] / 90)) % 4]
            end
end

# Part 2
def part_2(input)
  ship = [0, 0]
  waypoint = [10, 1]

  commands(input).each do |cmd|
    case cmd[:cmd]
    when 'N', 'E', 'S', 'W' then move_waypoint(waypoint, cmd)
    when 'F' then move_ship_to_waypoint(ship, waypoint, cmd[:value])
    else rotate_waypoint(waypoint, cmd)
    end
  end

  ship.map(&:abs).sum
end

def move_waypoint(waypoint, cmd)
  case cmd[:cmd]
  when 'N' then waypoint[1] += cmd[:value]
  when 'S' then waypoint[1] -= cmd[:value]
  when 'E' then waypoint[0] += cmd[:value]
  when 'W' then waypoint[0] -= cmd[:value]
  end
end

def move_ship_to_waypoint(ship, waypoint, value)
  ship[0] += (value * waypoint[0])
  ship[1] += (value * waypoint[1])
end

def rotate_waypoint(waypoint, cmd)
  rotation_in_radians = cmd[:value] * Math::PI / 180 * (cmd[:cmd] == 'R' ? -1 : 1)

  new_x = waypoint[0] * Math.cos(rotation_in_radians) - waypoint[1] * Math.sin(rotation_in_radians)
  new_y = waypoint[1] * Math.cos(rotation_in_radians) + waypoint[0] * Math.sin(rotation_in_radians)

  waypoint[0] = new_x.round
  waypoint[1] = new_y.round
end
