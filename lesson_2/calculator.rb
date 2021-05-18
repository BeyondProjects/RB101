# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# at the top of file

# at the top of file

require 'yaml'
MESSAGES = YAML.load_file('/home/jordan/RB101/lesson_2/calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=>  #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end 

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(messages('welcome'))

name = nil
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(messages('first_number'))
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  number2 = nil
  loop do
    prompt(messages('second_number'))
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) muliply
    4) divide
  MSG

  prompt(operator_prompt)


  operator = nil

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}!")

  prompt(messages('continue'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye'))
