
loop do
  user_input = nil
  number_of_lines = nil
  loop do
    puts '>> How many output lines do you want? ' \
    'Enter a number >= 3 (Q to quit): ' 
    user_input = gets.chomp.downcase
    break if user_input == 'q'
    number_of_lines = user_input.to_i
    break if number_of_lines >= 3
    puts ">> That's not enough lines."
  end

  break if user_input == 'q'

  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end
end