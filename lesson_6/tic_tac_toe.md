Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
marks a square on the board. First player to reach 3 squares in a row, including diagonals,
wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

PEDAC
joinor
PROBLEM
- Write method that takes three arguments an array, a seperator(string) and 'and/or'(string)
- have the method return the elements of the array seperated by the seperator and the last elements sperated by and/or

EXAMPLES
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

DATA STRUCTURE
input: array, seperator, word =default or
output: string of elements with seperator and final word

ALGORITHM
-define the method that takes three arguments
- create a new empty array
- iterate over the and add the seperator to each except the last.
- add the third argument to second last position on array

CODE
