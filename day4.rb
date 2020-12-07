# https://adventofcode.com/2020/day/4

# Part 1

def valid?(passport)
  passport[:ecl] &&
    passport[:pid] &&
    passport[:eyr] &&
    passport[:hcl] &&
    passport[:byr] &&
    passport[:iyr] &&
    passport[:hgt]
end

# Part 2

def valid_pattern?(passport)
  valid_eye_color?(passport[:ecl]) &&
    valid_passport_id?(passport[:pid]) &&
    valid_expiration_year?(passport[:eyr]) &&
    valid_hair_color?(passport[:hcl]) &&
    valid_birth_year?(passport[:byr]) &&
    valid_issue_year?(passport[:iyr]) &&
    valid_height?(passport[:hgt])
end

def valid_passport_id?(id)
  id =~ /\A(\d{9})\z/
end

def valid_eye_color?(color)
  %w[amb blu brn gry grn hzl oth].include?(color)
end

def valid_expiration_year?(year)
  year.to_i.between?(2020, 2030)
end

def valid_hair_color?(color)
  color =~ /\A#((\d|([a-f])){6})\z/
end

def valid_birth_year?(year)
  year.to_i.between?(1920, 2002)
end

def valid_issue_year?(year)
  year.to_i.between?(2010, 2020)
end

def valid_height?(height)
  delimiter_index = (height =~ /[^\d]+/)

  return until delimiter_index

  unit = height.slice(delimiter_index, 2)
  value = height.slice(0, delimiter_index)

  case unit
  when 'cm' then value.to_i.between?(150, 193)
  when 'in' then value.to_i.between?(59, 76)
  else
    false
  end
end
