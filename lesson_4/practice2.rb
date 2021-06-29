
def multiply(array, multiply_by)
  counter = 0

  loop do
    array[counter] = array[counter] * multiply_by
    counter += 1
    break if counter == array.size 
  end
  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers