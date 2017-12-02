def parse_input(file)
  File.readlines(file).map do |line|
    line.chomp.split("\t").map(&:to_i)
  end
end

def checksum(lines)
  lines.reduce(0) do |result, line|
    min, max = line.minmax.sort
    result + (max - min)
  end
end

def check_divisible(lines)
  lines.reduce(0) do |result, line|
    a, b = line
           .select { |item| line.find_all { |i| (item % i).zero? || (i % item).zero? }.length > 1 }
           .sort
           .reverse

    result + (a / b)
  end
end

p checksum(parse_input("./input.txt")) == 54426
p check_divisible(parse_input("./input.txt")) == 333
p check_divisible([[3, 8, 6, 5]]) == 2
