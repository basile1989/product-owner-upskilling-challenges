categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]


activity = {
"name" => "Escape Game",
"category" => categories[0].upcase,
"city" => "Nantes",
"duration" => 60,
"participants" => 4,
"price" => 120
}


puts "#{activity["name"]} [#{activity["category"]}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["participants"]} participants"
puts "Charged #{activity["price"]}€"
