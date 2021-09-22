SPADES = [*"2".."10"] + %w[J Q K A]
HEARTS = [*"2".."10"] + %w[J Q K A]
CLUBS = [*"2".."10"] + %w[J Q K A]
DIAMONDS = [*"2".."10"] + %w[J Q K A]
deck = []

def welcome_msg
  system 'clear'
  prompt "Welcome to 21. First player to 5 wins!"
  prompt "Game: #{$game_count}."
  prompt "You have won #{$player_games_won} game/s."
  prompt "The dealer has won #{$dealer_games_won} game/s."
  prompt "Please hit any key to begin."
  gets.chomp
end

def prompt(msg)
  puts "=> " + msg
end

def initialise_deck(deck)
  SPADES.each_index do |card|
    deck << ['S', SPADES[card]]
  end

  HEARTS.each_index do |card|
    deck << ['H', HEARTS[card]]
  end

  CLUBS.each_index do |card|
    deck << ['C', CLUBS[card]]
  end

  DIAMONDS.each_index do |card|
    deck << ['D', DIAMONDS[card]]
  end
  deck
end

def deal(deck)
  dealt_cards = deck.sample(1)
  dealt_cards.each { |card| deck.delete(card) }
  dealt_cards
end

def total(deck)
  values = deck.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def initial_card_display(player_cards, dealer_cards)
  prompt "Your cards are #{player_cards}"
  prompt "The dealer has #{dealer_cards[0]} and an unknown card."
end

def hit?
  answer = nil
  loop do
    prompt "Would you like to 'hit' or 'stay'?"
    answer = gets.chomp.downcase
    if answer.start_with?('s')
      answer = false
      break
    elsif answer.start_with?('h')
      answer = true
      break
    else
      prompt "That is not a valid input"
    end
  end
  answer
end

def busted?(player_score, dealer_score)
  player_score > 21 || dealer_score > 21 ? true : false
end

def who_busted(player_score, dealer_score)
  return "Player" if player_score > 21
  return "Dealer" if dealer_score > 21
end

def detect_winner(player_score, dealer_score)
  if who_busted(player_score, dealer_score) == "Player"
    $dealer_games_won += 1
    return "Dealer"
  elsif who_busted(player_score, dealer_score) == "Dealer"
    $player_games_won += 1
    return "Player"
  end

  if player_score > dealer_score
    $player_games_won += 1
    "Player"
  elsif player_score < dealer_score
    $dealer_games_won += 1
    "Dealer"
  elsif player_score == dealer_score
    "Nobody"
  end
end

def deal_to_dealer(dealer_score, dealer_cards)
  if dealer_score < 17
    prompt "The dealer hits..."
    dealer_cards += deal(deck)
  end
end

def game_over(player_score, dealer_score, dealer_cards, player_cards)
  system 'clear'
  if busted?(player_score, dealer_score)
    prompt "#{who_busted(player_score, dealer_score)} busted!"
  end
  prompt "#{detect_winner(player_score, dealer_score)} wins!"
  prompt "The dealer had #{dealer_cards} (#{dealer_score})."
  prompt "You had #{player_cards} (#{player_score})."
  gets.chomp
end

def play_again?
  loop do
    prompt "Would you like to play again (y/n)?"
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      prompt "That is not a valid input."
    end
  end
end

loop do
  $player_games_won = 0
  $dealer_games_won = 0
  $game_count = 1
   
  loop do
    welcome_msg
    deck = initialise_deck(deck)
    player_cards = deal(deck)
    dealer_cards = deal(deck)
    player_cards += deal(deck)
    dealer_cards += deal(deck)

    player_score = total(player_cards)
    dealer_score = total(dealer_cards)

    initial_card_display(player_cards, dealer_cards)
    prompt "You are on #{player_score}."

    loop do
      if busted?(player_score, dealer_score)
        game_over(player_score, dealer_score, dealer_cards, player_cards)
        break
      elsif hit?
        player_cards += deal(deck)
        player_score = total(player_cards)
        prompt "You draw a #{player_cards.last}"
        gets.chomp
        system 'clear'
        prompt "The dealer is still showing #{dealer_cards[0]} and an unknown card."
        prompt "Your cards are now #{player_cards}"
        prompt "You are now on #{player_score}"
      else
        prompt "You choose to stay."
        break
      end
    end

    while dealer_score < 17 && !busted?(player_score, dealer_score)
      prompt "The dealer is on #{dealer_score} with #{dealer_cards}."
      prompt "The dealer hits..."
      dealer_cards += deal(deck)
      dealer_score = total(dealer_cards)
      prompt "The dealer draws a #{dealer_cards.last}"
      gets.chomp
    end

    game_over(player_score, dealer_score, dealer_cards, player_cards)
    $game_count += 1
    if $player_games_won == 5
      prompt "You have won 5 games! Congratulations!"
      break
    elsif $dealer_games_won == 5
      prompt "The dealer wins! Unlucky."
      break
    end
  end

  break unless play_again?
end
prompt "Thanks for playing 21!"
