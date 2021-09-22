a = "hello"
b = a

b << " world"

# 1 object and 2 variables pointing to the same object.

puts a #=> hello world
puts b #=> hello world

a += b # This is the same as a = a + b, therefore it is acually REASSIGNING the variable 'a' meaning we now have 2 objects and 2 variables.
# 'b' will be pointing to the initial assigned object whereas 'a' is pointing to the object it has been reassigned to.

puts a #=> hello worldhello world
puts b #=> hello world