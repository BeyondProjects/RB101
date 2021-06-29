def select_letter(sentence, letter)
  selected_char = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]
    if current_char == letter
      selected_char << current_char
    end
    counter += 1
  end
  selected_char
end



question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""