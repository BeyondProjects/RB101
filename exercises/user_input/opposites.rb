def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
input_1 = nil
input_2 = nil
answer = nil

loop do
  loop do
    puts ">> Please enter a positive or negative integer: "
    input_1 = gets.chomp
    break if valid_number?(input_1)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  loop do
    puts ">> Please enter a positive or negative integer: "
    input_2 = gets.chomp
    break if valid_number?(input_2)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  input_1 = input_1.to_i
  input_2 = input_2.to_i

  if (input_1.negative? && input_2.positive?) || (input_1.positive? && input_2.negative?)
    break
  end

  puts ">> Sorry. One integer must be positive, one must be negative. " \
  "Please start over"
end

answer = input_1 + input_2

puts "#{input_1} + #{input_2} = #{answer}"
