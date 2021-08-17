VOWEL = %w[a e i o u]

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, array|
  array.each do |element|
    element.chars do |char|
      puts char if VOWEL.include?(char)
    end  
  end
end