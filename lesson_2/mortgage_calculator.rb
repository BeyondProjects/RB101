# get the loan amount
# get the annual percentage rate
# get the loan duration
# calculate the montly interest rate
# calculate the loan duration in months
# calculatate the monthly repayment

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

name = nil
puts "Welcome to Mortgage Calculator. Please start by entering your name: "
loop do
  name = gets.chomp
  if name.empty?
    puts "Please enter your name to begin: "
  else
    break
  end
end

loop do
  puts "Hi #{name.capitalize}, please enter the total loan amount: "
  loan_amount = nil
  loop do
    loan_amount = gets.chomp
    if number?(loan_amount) && loan_amount.to_f > 0
      break
    else
      puts "Please enter a number that is positive: "
    end
  end
  loan_amount = loan_amount.to_f

  puts "Please enter the annual percentage rate: "
  puts "(Example: 5 for 5% or 2.5 for 2.5%)"
  interest_rate = nil
  loop do
    interest_rate = gets.chomp
    if number?(interest_rate) && interest_rate.to_f > 0
      break
    else
      puts "You must enter a positive number."
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12

  puts "Please enter the loan duration (in years)?: "
  duration = nil
  loop do
    duration = gets.chomp
    if number?(duration) && duration.to_f > 0
      break
    else
      puts "Please enter a positive number."
    end
  end

  duration_months = duration.to_f * 12

  monthly_payment = loan_amount * (monthly_interest_rate / (1 -
    (1 + monthly_interest_rate)**(-duration_months)))

  puts "Your repayments will be $#{format('%.2f', monthly_payment)}
  for #{duration_months} months."

  puts "Type 'Y' to perform another calculation."
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

puts "Thanks for using Mortgage Calculator."
