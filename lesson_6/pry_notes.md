What is bugging?

Bugs are human arrows in code
Debugging is the process of identifying and fixing those errors


How do we debug code?
Identify the problem - track down where the problem is occurring, locate the source of the problem
Understand the problem - 
Implement a solution - change the code to eliminate the issue.

Type of error?

Syntax Errors: 
- The code you have written does not conform to the grammar of the programming language you are using.
- Generally stops your code from functioning


Logical Errors:
- Errors in othe logic of your code
- Code generally runs. But produces unexpected results

Using pry: 
- pry is a ruby gem
- Pry is a REPL:
- Read-Evaluate-Print Loop 

pry is an interactivce environment that:
- Takes user input
- Evaluates the input
- return s the results to the user

Need to: require ‘pry’
*binding.pry
 - a binding is something that contains references to any variables that were in scope at the point where it was created. 
- Pry interrupts the programs execution and pries open the binding so that we can have a look around
- whereami prompt displays where you are in the program

STEPPING THROUGH AND INTO CODE
-  pry-byebug (is a gem and needs to be installed, also need to require 'pry-byebug')
- extentends pry with some additional commands
    - next
    - step
    - continue
- Similar gems exist such as pry-nav and pry-debugger
- The concept of stepping through and into code is not limited to 'pry' or Ruby
- 


