array = []
hsh.each do |fruit, details|
  details.each do |key, value|
    if key == :colors
      array << value.capitalize
    elsif key == :size
      array << value.upcase
    end
  end
end

p array