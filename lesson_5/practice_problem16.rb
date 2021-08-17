CHARACTERS = [*"1".."9"] + [*"a".."z"]



def generate_code
  code = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times do
      code << CHARACTERS.sample
    end
    code << '-' unless index >= sections.size - 1
  end
  code
end

p generate_code



