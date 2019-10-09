categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

activities = [
  {
    "name" => "Escape Game",
    "category" => categories[0].upcase,
    "city" => "Nantes",
    "duration" => 60,
    "participants" => 4,
    "price" => 120
    },
    {
    "name" => "Wine Tasting",
    "category" => categories[5].upcase,
    "city" => "Paris",
    "duration" => 90,
    "participants" => 15,
    "price" => 300
    },
    {
    "name" => "Rugby",
    "category" => categories[1].upcase,
    "city" => "Marseille",
    "duration" => 80,
    "participants" => 46,
    "price" => 200
    }
  ]

activities.each do |activity|
puts "#{activity["name"]} [#{activity["category"]}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["participants"]} participants"
puts "Charged #{activity["price"]}€"

puts "
---

"
end
