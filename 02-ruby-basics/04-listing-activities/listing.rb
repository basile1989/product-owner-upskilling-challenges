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


puts "#{activities[0]["name"]} [#{activities[0]["category"]}]"
puts "Located in #{activities[0]["city"]}"
puts "Duration of #{activities[0]["duration"]} minutes"
puts "For #{activities[0]["participants"]} participants"
puts "Charged #{activities[0]["price"]}€"

puts "
---

"

puts "#{activities[1]["name"]} [#{activities[1]["category"]}]"
puts "Located in #{activities[1]["city"]}"
puts "Duration of #{activities[1]["duration"]} minutes"
puts "For #{activities[1]["participants"]} participants"
puts "Charged #{activities[1]["price"]}€"

puts "
---

"
