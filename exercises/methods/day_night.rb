
def time_of_day(sun)
  if sun == true
    puts "It's daytime!"
  else
    puts "It's nighttime!"
  end
end


daylight = [true, false].sample
time_of_day(daylight)
