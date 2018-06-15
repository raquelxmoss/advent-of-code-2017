def parse_input(file)
  File.readlines(file).map do |line|
    line.chomp.to_i
  end
end

def out_of_bounds(current_position, input)
  current_position < 0 || current_position >= input.length
end

def escape_count(input)
  steps_taken = 0
  current_position = 0

  until out_of_bounds(current_position, input) do
    previous_position = current_position
    instruction = input[previous_position]
    current_position = previous_position + instruction
    steps_taken += 1
    input[previous_position] += 1
  end

  steps_taken
end

p escape_count("0 3 0 1 -3".split(" ").map(&:to_i)) == 5
p escape_count(parse_input('input.txt')) == 325922

# Now, the jumps are even stranger: after each jump, if the offset was three or more, instead decrease it by 1. Otherwise, increase it by 1 as before.
#
def escape_count_2(input)
  steps_taken = 0
  current_position = 0

  until out_of_bounds(current_position, input) do
    previous_position = current_position
    instruction = input[previous_position]
    current_position = previous_position + instruction
    steps_taken += 1

    increment = instruction > 2 ? -1 : 1
    input[previous_position] += increment
  end

  steps_taken
end

p escape_count_2("0 3 0 1 -3".split(" ").map(&:to_i)) == 10
p escape_count_2(parse_input('input.txt')) == 24490906
