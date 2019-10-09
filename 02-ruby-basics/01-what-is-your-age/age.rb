puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "What is your year of birth?"
birth_year = gets.chomp.to_i # asks user to type something in the Terminal

age =  2019 - birth_year


puts "Hey #{name}! You are #{age} years old this year."
