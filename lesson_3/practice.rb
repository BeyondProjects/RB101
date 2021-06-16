a = 7
array = [1, 2, 3]

def my_value(ary, test_a)
  ary.each do |b|
    test_a += b
  end
end

my_value(array, a)
puts a