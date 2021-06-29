# The PEDAC Process

# P: Undertstanding the problem

- Establih the rules/define the boundaries of the problem
  - Assess available information
  - Restating explicit requirments
  - Identify Implicit requirements
- spend enough time. Dont rush this step.

**General Example**

Given a string, produce a new string with every other word removed. 

- Explicit Requirements
  - Input: string
  - output: new string.
  - Remove every other word from input string

- Questions?
  - What do we mean by every other word?
  - How do we define a word in this context?
    - words are delimited by spaces

# E: Examples and Test Cases

- can confirm/refute assumptions
- Help to answer questions about implicite requirements
- Act as assertions which help to codify the rules and boundaries.


# D: Data Structures

- Help reason with data logically
- Help Interact with data at implementation level
- Thinking in terms of data structures is part of problem solving processing
- Data structures are closely related to algorithm
  - Set of steps from input to output
    - involes structuring data in a certain way

# A: Algorithms

- A logical sequence of steps from accomplishing a task or objective
  - Cloesely linked to data structures
  - series of steps to structure data to produce the required output
- stay abstract/high-level when think about algorithm
- Avoid implementation detail
- Don't worry about efficiency for now

# C: Implementing a solution in Code

- Translating solution algorithm to code
- Think about algorithm in cotext of programming language
  - Language features and constraints
  - Characteristics of data structures
  - built in funtctions/methods
  - Syntax and coding patterns
- create test cases
- code with intent

## Sum Even Number Rows

Imagine a sequence of consecutive numbers even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row. 

- Sequence of even integers
- Sequence begins with 2
- Integers are consecutive
- sequence is grouped into rows
- each row is incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers. 
- Output: a single integer
  - The sum of the integers in the row identified by the input integer.

- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, ... 

2
4, 6
8, 10, 12
14, 16, 18, 20
...

- How do we create the structure?

**Examples**

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

2 --> 2
4, 6 --> 10
14, 16, 18, 20 --> 68

**Data Structure**

2
4, 6
8, 10, 12
14, 16, 18, 20
...

- Overall structure represents a sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a order in the context if the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20]
  .... 
]

**Algorithm**

1. Create an empty 'rows' array to contain all of the rows
2. create a 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
  - All rows have been created when the length of the 'rows' array is equal to the input integer
4. sum the final row
5. return the sum of the final row

*Problem: Create a row*

Rules: 
- Row is an array
- Array contains integers
- Integers are consecutive even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - the start integer
  - length of the row
- Output: the row itself '[8, 10, 12]'

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data Structures:
 - An array of integers

Algorithm:
1. Create an empty 'row' to contain the integers
2. Add the starting integer
3. increment the starting integer by 2 to get the next integer in the sequence
4. repeat steps 2 and 3 until the array has reached the correct length
5. Return the 'row' array

##Final Thoughts
- PEDAC npot completely linear process
- be prepared to move back and forward between the steps
- switch from implementation mode to abstract problem solving mode when necessary
- Don't try to problem solve at the code level.

