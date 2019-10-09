categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]


puts "What activity do you want to add ?"
  categories << gets.chomp

  categories = categories.sort
puts "[CATEGORIES OF ACTIVITIES]"

  categories.each do |activity|
    puts "- #{activity}"
  end

  puts "Total: #{categories.size}"
