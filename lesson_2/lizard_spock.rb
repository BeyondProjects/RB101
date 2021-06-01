VALID_CHOICES = ['rock', 'scissors', 'paper', 'spock', 'lizard']

def win?(first, second)
    (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

choice = nil
user_count = 0
computer_count = 0
loop do
  prompt("Welcome to the game. Once a player has reached three wins the match is over.")
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice...")
      end
    end

    computer_choice = VALID_CHOICES.sample
    prompt("You choose: #{choice}. The computer chose: #{computer_choice}")
    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      user_count += 1
    elsif win?(computer_choice, choice)
      computer_count += 1
    end

    prompt("The score is, Player: #{user_count} Computer: #{computer_count}")
    if computer_count == 3
      prompt("The computer has won 3 games!")
      break
    elsif user_count == 3
      prompt("You have won 3 games!")
      break
    end
  end
      
  prompt("Game over. Would you like to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
