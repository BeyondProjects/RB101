
PASSWORD = 'SecreT'
USERNAME = 'admin'

loop do
  puts ">> Please enter user name: "
  username_input = gets.chomp

  puts ">> Please enter your password: "
  password_input = gets.chomp
  
  break if password_input == PASSWORD && username_input == USERNAME
  puts ">> Authorization failed!"
end

puts ">> Welcome!"