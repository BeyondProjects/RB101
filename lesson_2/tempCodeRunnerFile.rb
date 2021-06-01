def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'scissors' && second == 'rock') ||
  (first == 'paper' && second == 'scissors')
end