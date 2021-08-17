arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_array = arr.map do |outter_element|
              outter_element.select do |inner_element|
                inner_element % 3 == 0
              end
            end

p new_array