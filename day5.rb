# https://adventofcode.com/2020/day/5

# Part 1

def seat_id(string)
  8 * row(string[0..6]) + column(string[7..])
end

def row(rows)
  row = 0
  rows.reverse.split("").each_with_index do |p, i|
    row += (p == "F" ? 0 : 2 ** i)
  end

  row
end

def column(colums)
  colum = 0
  colums.reverse.split("").each_with_index do |p, i|
    colum += (p == "L" ? 0 : 2 ** i)
  end

  colum
end

#  Part 2

def missing_seat(seat_ids)
  n = seat_ids.length + 1
  min_seat_id = seat_ids.min
  max_seat_id = seat_ids.max
  (n * (min_seat_id + max_seat_id)) / 2 - seat_ids.sum
end
